define(function(require, exports, module){
	require('backbone');
	//var AllViews = require('./view');
	//console.log(AllViews);
	require('cookie');
	require('modal');
	var Post = require('./post');
	var User = {};
	User.Model = Backbone.Model.extend({
		initialize: function(){
		},
		defaults: {
			email:'vikingmute@gmail.com',
			password:'0000000',
			uname:'vikingmute',
			avatar:'/images/defualt.jpg',
			flag:'123456',
			isLogin:'0',
			status:'fail'
		},
		login:function(){
			this.url = "/api/login";
			this.save({},{
			success: function (model, response) {
				if(model.get('status') == 'fail'){
					alert('登录失败 请重新输入');
					$('.loginform')[0].reset();
				}else{
					$('#loginModal').modal('hide');
					var view = new User.View({model: model});
					$('.rightside').remove();
					$('#pages').append(view.render().el);
				}
			},error: function (model, response) {
					console.log(model);
				}
			})
		},
		register:function(){
			this.url = "/api/register";
			this.save({},{
			success: function (model, response) {
				if(model.get('status') == 'fail'){
					alert('注册失败 问题未知');
					$('.regform')[0].reset();
				}else{
					$('.vhint').html("注册成功 请登录 窗口一秒后关闭");
					setTimeout(function(){
						$('#regModal').modal('hide');
						$('.vhint').html('');
					},1000);
				}
			},error: function (model, response) {
					console.log(model);
				}
			})
		}
	});

	User.View = Backbone.View.extend({
		tagName:"div",
		className:"userInfo rightside",
		template: _.template($('#user-template').html()),
		events:{
			"click #upload" : "openDropDown",
			"click #settings" : "configSettings",
			"click #logout" : "doLogout",
			"click #upload-word" : "openModal"
		},
		render:function(){
			this.$el.html(this.template(this.model.toJSON()));
			return this;
		},
		openModal:function(e){
			$('#myModal').modal({'backdrop':'static','show':true});
			//post a new entry
			$('#newPost').on('click',function(e){
				//just skip the validate here
				var newpost = {
					title:$('#rmain').val(),
					author:$('#rauthor').val(),
					description:$('#rdesc').val(),
					uid:$.cookie('uid')
				}
				var entry = new Post.Model(newpost);
				entry.publish();
				e.preventDefault();
			})
		},
		openDropDown:function(e){
			var submenu = $('#post-menu');
			if(submenu.css('display') == 'block'){
				submenu.hide();
			} else {
				submenu.show();
			}
			$(document).unbind('click');
			$(document).bind('click',function(e){
				var tar = e.target;
				if($(tar).attr('id') != 'upload'){
					if($(tar).parents('#post-menu').length != 1){
						submenu.hide();
					}
				}
				e.preventDefault();
			})
			e.preventDefault();
		},
		configSettings:function(e){
			e.preventDefault();
		},
		doLogout:function(e){
			$.removeCookie('username');
			$.removeCookie('flag');
			window.location.href = "http://fs.local/";
			e.preventDefault();
		}
	});

	 module.exports = User;

})

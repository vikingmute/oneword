//all views include in this file
define(function(require, exports, module) {
	require('backbone');
	require('cookie');
	var User = require('./user');
	var AllViews = {};
	AllViews.AppView = Backbone.View.extend({
		el:$('body'),
		initialize:function(){
			_.bindAll(this, 'render');
			this.render();
		},
		events:{
			"click #login" : "openModal",
			"click #register" : "startReg"
		},
		render:function(){
			//check if the user is login
			var userinfo = {};
			if($.cookie('username') && $.cookie('flag')){
				userinfo.uname = $.cookie('username');
				userinfo.flag = $.cookie('flag');
				userinfo.isLogin = '1';
				var user = new User.Model(userinfo);
				user.login();
			}

		},
		openModal:function(e){
			$('#loginModal').modal({'backdrop':'static','show':true});
			var self = this;
			$('.login-yiju').on('click',function(){
				self.userinfo = {email:$('#uemail').val(),password:$('#upwd').val()};
				if ( $('#remPwd').prop("checked") ){
					self.userinfo.remPwd = '1';
				}else{
					self.userinfo.remPwd = '0';
				}
				var user = new User.Model(self.userinfo);
				user.login();

			});
			e.preventDefault();
		},
		startReg:function(e){
			$('#regModal').modal({'backdrop':'static','show':true});
			e.preventDefault();
		}

	})
	module.exports = AllViews;
})



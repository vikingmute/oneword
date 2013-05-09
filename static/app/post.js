// the main file for post model,collection and view
//keep going have a little faith
define(function(require, exports, module){
	require('backbone');
	var Post = {};
	Post.Model = Backbone.Model.extend({
		initialize: function(){
		},
		defaults: {
			title:'a test quote',
			author:'a normal guy',
			description:'a very long stuff and keep going',
			type:'text',
			fav: 0,
			uid: 0,
			publish_time:0
		},
		publish:function(){
			this.url = "/api/postentry";
			this.save({},{
				success: function (model, response) {
					if(model.get('status') == 'fail'){
						alert('登录失败 请重新输入');
						//$('.loginform')[0].reset();
					}else{
						//$('#loginModal').modal('hide');
						alert('发表成功');
					}
				},error: function (model, response) {
						console.log(model);
				}
			})

		}
	})

	Post.Collection = Backbone.Collection.extend({
		model:Post.Model,
		url:'/api/list/1'
	})

	Post.ViewList = Backbone.View.extend({
		tagName : 'li',
		className: 'entry-list',
		template: _.template($('#post-list-template').html()),

		initialize: function() {
			//this.render();
		},
		render: function() {
			this.$el.html(this.template(this.model.toJSON()));
			return this;
		}
	})

	Post.ViewDetail = Backbone.View.extend({
		tagName : 'div',
		className: 'entry-detail',
		template: _.template($('#post-detail-template').html()),

		initialize: function() {
			//this.render();
		},
		render: function() {
			this.$el.html(this.template(this.model.toJSON()));
			return this;
		}

	})

	module.exports = Post;
})
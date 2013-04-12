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
			desc:'a very long stuff and keep going',
			type:'text',
			upvote:'0',
			collected:'0'
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
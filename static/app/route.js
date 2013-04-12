define(function(require, exports, module){
	require('backbone');
	var Post = require('./post');
	var AppRounter = Backbone.Router.extend({
		routes: {
			"":"vindex",
			"home":"vindex",
			"piece/:id" : "getPost",
			"list/:id" : "getList"
		},
		vindex:function(){
			console.log('home page baby');
		},
		getPost:function(id){
			var detail= new Post.Model();
			detail.url = "/api/book/"+id;
			detail.bind('change',function(){
				var view = new Post.ViewDetail({model: detail});
				$('.post').html(view.render().el);
			});
			detail.fetch();
		},
		getList:function(id){
			console.log('list stuff' + id);
		}

	})

	module.exports = AppRounter;
})
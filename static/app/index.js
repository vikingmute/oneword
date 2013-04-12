/*start from here
keep going and make it real
*/
define(function(require, exports, module) {

	// 通过 require 引入依赖
	var AllViews = require('./view');
	var Post = require('./post');
	var Rounter = require('./route.js');
	var appview = new AllViews.AppView();
	var entry = new Post.Model();
	var app_router = new Rounter;

	Backbone.history.start();

});
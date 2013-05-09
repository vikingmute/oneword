seajs.config({
	plugins: ['shim'],
	alias: {
		'jquery': {
			src: 'lib/jquery-1.9.1.min.js',
			exports: 'jQuery'
		},

		'underscore': {
			src: 'lib/underscore.js',
			exports: '_'
		},

		'backbone': {
			src: 'lib/backbone.js',
			deps: ['underscore', 'jquery'],
			exports: 'Backbone'
		},
		'modal':{
			src:'lib/modal.js',
			deps:['jquery']
		},
		'cookie':{
			src:'lib/cookie.js',
			deps:['jquery']
		},
		'dropdown':{
			src:'lib/dropdown.js',
			deps:['jquery']
		}
	}
})
jeet            = require 'jeet'
nib             = require 'nib'
rupture         = require 'rupture'
js_pipeline     = require 'js-pipeline'
css_pipeline    = require 'css-pipeline'
dynamic_content = require 'dynamic-content'

jsSrc 					= 'assets/js/'

module.exports =
	ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf', 'project_assets/**/*', 'project_assets/*']

	extensions: [
		js_pipeline(files: [
			jsSrc + 'jquery.js',
			jsSrc + 'barba.js',
			jsSrc + 'TweenMax.js',
			jsSrc + 'jquery.inview.js',
			jsSrc + 'prism.js',
			jsSrc + 'main.js'
		], out: 'js/build.js', minify: false),
		css_pipeline(files: 'assets/css/master.styl', minify: false),
		dynamic_content()
	]

	stylus:
		use: [jeet(), nib(), rupture()]
		sourcemap: true
		compress: false

	'coffee-script':
		sourcemap: true

	jade:
		pretty: true

	server:
		clean_urls: true
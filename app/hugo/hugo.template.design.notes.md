## [official hugo documenation](https://gohugo.io/documentation/) ##

 1. creating a new hugo theme
	- ``hugo new theme ebook``
	
 1. add theme to ``config.toml`` file
	- ``theme = "ebook"``
 1. add a hugo variable to the ``index.html`` theme file to confirm site is rendering
	- ``<h1>{{ .Title }}</h1>``
 1. include the hugo partial for the livereload footer to communicate with nginx
Web Server
===============

Archwomen.org webserver configuration files

This configuraiton supports php, ruby, python and markdown with simple virtual hosts and user web directories.

To Do: 

* Add secure wed directories 
* Performance tweaks
* Comments


### Lighttpd - lightweight web server with a simple configuration file ###

Simple Virtual Hosts

simple-vhost.server-root = "/srv/http/"

simple-vhost.default-host = "archwomen.org"

simple-vhost.document-root = "public"

/srv/http

/srv/http/archwomen.org

/srv/http/archwomen.org/public

/srv/http/mail.archwomen.org/

/srv/http/mail.archwomen.org/public

### Gunicorn ###

A python wsgi http server

### These packages need to be installed for the lighttpd configuration to work: ###

* php
* php-cgi
* python
* python2
* gunicorn
* ruby
* rails
* ruby-fcgi

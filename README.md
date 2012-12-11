lighttpd-config
===============

Archwomen.org lighttpd configuration files

This configuraiton supports php, ruby, python and markdown with simple virtual hosts and user web directories.

To Do: 

* Add secure wed directories 
* Performance tweaks
* Comments

Simple Virtual Hosts

simple-vhost.server-root = "/srv/http/"
simple-vhost.default-host = "archwomen.org"
simple-vhost.document-root = "public"

/srv/http
/srv/http/archwomen.org
/srv/http/archwomen.org/public
/srv/http/mail.archwomen.org/
/srv/http/mail.archwomen.org/public

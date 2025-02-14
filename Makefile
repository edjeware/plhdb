# Copyright (C) 2016, 2024 The Meme Factory, Inc.  http://www.karlpinc.com/
#
#    This file is part of PLHDB2.
#
#    PLHDB2 is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with PLHDB2.  If not, see <http://www.gnu.org/licenses/>.
#
# Karl O. Pinc <kop@meme.com>
#

include help.mk
## ############################################################################
##                              Website Installation
##
## Variables:
##

# Where the website document root lives
##    TARGET_WWW         Where the website is installed, usually this is
##                       the webserver's document root.  Defaults to:
##                       /var/www/html    (See also, the caution below.)
TARGET_WWW = /var/www/html

##
## The following targets may be used:
##

all:

www:
	mkdir www

.PHONY: build_www
build_www: www
	rm -rf www/*
	cp -a static/* www/
##	cp -a adminer/production www/adminer
##	cp -a adminer/demo www/

##   install_www         Install the website's files in the TARGET_WWW dir
##                       CAUTION: Deletes everything in TARGET_WWW before
##                       installation.
.PHONY: install_www
install_www: build_www
	rm -rf $(TARGET_WWW)/*
	cp -a www/* $(TARGET_WWW)/

adminer-4.8.1.php:
	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

includes_setup: adminer-4.8.1.php
	mkdir -p includes
	cp adminer-4.8.1.php includes/adminer-current

up: build_www 
## includes_setup
	docker-compose up --build

##   clean               Cleanup generated files, etc., in the checked out git
##                       repo that are not under revsion control.
.PHONY: clean
clean:
	rm -rf www
	make -C db clean
	make -C bin clean
##   dclean              Clean docker images and volumes
.PHONY: dclean
dclean:
	docker-compose down
	docker-compose rm -v db
	docker volume rm plhdb_postgres_data

##   dpsql-user          From docker container, connect to the plhdb as dummy user
dpsql-user:
	psql -d plhdb -U dummy_user -p 5444 -h localhost
# UDOO Quad/Dual Documentation

[![Software License](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)](https://github.com/UDOOboard/X86-Docs/LICENSE)

This repository contains the source code for the documentation hosted at [www.udoo.org/docs/](http://www.udoo.org/docs/).


## Build the documentation locally
On PHP7+ install XML and mbstring modules:

    sudo apt install php7.4 composer php7.4-xml php7.4-mbstring
    composer install

Then build the documentation with

    composer generate && cp -r img/ static/

To serve the documentation from a development webserver, run

    cd static && php -S localhost:8080

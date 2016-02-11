## Overview

Visit our Tutorials section to learn more about: [UDOO Webserver](/tutorial/udoo-web-server/).

Everyone has heard the word “Server” almost once in his life. A server basically is a machine which hosts something, could be a service, a web page, a database and so on. Servers are so ubiquitous because they allow lot of other devices, clients, to connect to them and rely on their serving capabilities to perform an endless range of operations.

UDOO DUAL/QUAD can be both a Server and a client, thanks to its linux-based operating system. Today we are going to learn how to use UDOO DUAL/QUAD as a Web Server. But why would we need to turn UDOO DUAL/QUAD into such thing?
For many reasons, such as:

<ul>
	<li>We can use UDOO DUAL/QUAD as a local web server, using it to host custom built web pages</li>
	<li>We can access UDOO DUAL/QUAD from everywhere, all over the world</li>
	<li>We can control UDOO DUAL/QUAD operations from a wide range of devices (both through internet or local network)</li>
</ul>


This will allow our projects to be as connected as we want them to be, for example remote controlling them via a web user interface. Or to check our project status thousands of kilometers away. We can also develop complex interactive systems, that will be connected to every device we want, through internet or local network. Ever heard about <a href="http://en.wikipedia.org/wiki/Internet_of_Things">internet of things</a>?

Sounds amazing, isn’t it?

So, lets start!

What we are going to need is a particular software environment, called LAMP. Lamp is the acronym of Linux, Apache, MySQL and PHP. Distinct utilities that combined constitute the basis of every Web Server (there are however some variants, but this is generally accepted to be the standard).

We basically have two pathways to get thigs done:


<h3>First, the pre-cooked way</h3>
We can use tasksel, an utility which can download and install groups of softwares for a particular use.

```bash

sudo apt-get install tasksel

```

<img alt="APTINSTALL" style="width:400px; height:263px" src="http://www.udoo.org/wp-content/uploads/2013/11/APTINSTALL.png" width="746" height="491" />

Once launched we can use it to install the LAMP Server metapackage (aka group of softwares)

```bash

sudo tasksel

```

<img class="aligncenter size-full wp-image-2625" style="width:400px; height:263px" alt="TASKEL" src="http://www.udoo.org/wp-content/uploads/2013/11/TASKEL.png" width="746" height="491" />

just select LAMP Server with spacebar and hit enter

Take a coffe while tasksel does the dirty work for you


<h3>Second, how real man do it</h3>

Cool people know what they are about to do. So we’ll take an in depth view of every software in the LAMP package, and their specific purpose. So you’ll have an idea of what does what, and why we need all of them:

* <strong>Apache</strong>
	
Apache is our web-server, the actual software which handles incoming connections and serves requested web pages.
To install it:&nbsp;

```bash

sudo apt-get install apache2

```

To make sure the access rights are correct type:

```bash

sudo groupadd www-data
sudo usermod -g www-data www-data
sudo chown -R www-data:www-data /var/www

```

* <strong>PHP5</strong>

PHP5 is the php interpreter, this serves up php code to the Apache server
To install it:&nbsp;

```bash

sudo apt-get install php5 php5-cli

```

* <strong>MySql-Server</strong>

Mysql server is the database holder. We’ll use it to insert the data we need in a database, useful for creating web pages with the data we need.
They should have been installed along with Apache, in the previous steps. However, to be sure you can install them with:&nbsp;

```bash

sudo apt-get install mysql-server mysql-client

```

* <strong>PHP5-mysql and phpmyadmin</strong>

These are needed to integrate sql database with php interpreter. This will allow web pages to handle and interact our databases. Phpmyadmin is a handy tool to create and manage databases. You’ll be asked to set a root password, just to be sure, create a strong password (you should always take extra caution when root access is involved). Then, when you’ll be asked to choose from Apache or Httpd, choose Apache, since this is the web server we are using.

We are going to install them along with Nano, a useful text editor, with:&nbsp;

```bash

sudo apt-get install php5-mysql phpmyadmin php5-curl nano

```

<em>After the installation has completed, add phpmyadmin to the apache configuration. So, edit Apache configuration with:</em>

```bash

sudo nano /etc/apache2/apache2.conf

```

And paste the phpmyadmin apache configuration string to the bottom of the file

```bash

Include /etc/phpmyadmin/apache.conf

```

Then restart apache, to allow our modifications to take place:

```bash

sudo service apache2 restart

```

* Done!


Time to see if everything is set up properly. To do so, open a web browser on UDOO DUAL/QUAD and type

```bash

http://localhost

```

you should see the following:

<img class="aligncenter size-large wp-image-2627" style="width:400px; height:96px" alt="itworks" src="http://www.udoo.org/wp-content/uploads/2013/11/itworks-1024x246.png" width="1000" height="240" />

That means that Apache is running correctly.

Now, let’s see if also phpmyadmin is properly set:

```bash

http://localhost/phpmyadmin

```

<img class="aligncenter size-large wp-image-2628" style="width:400px; height:264px" alt="PHPMYADMIN" src="http://www.udoo.org/wp-content/uploads/2013/11/PHPMYADMIN-1024x676.png" width="1000" height="660" />

If all above works, that means that we can access locally our brand new LAMP server.

The root of your webserver, the path where your webpages are located, is

```bash

/var/www

```

You can replace the default index.html page with your custom ones. If you wish you can also install Wordpress, Joomla or the CMS you prefer here. Just copy the needed files into that folder.

After copying your custom pages on <em>/var/www</em>, remember to restart the apache service with:

```bash

sudo service apache2 restart

```

But, we’re only half way through it. Of course, what we need is to access it from our network, or from internet.

To check if our UDOO DUAL/QUAD is visible from our network, just use the same commands as above, but typing <a href="http://www.udoo.org/docs/Connecting%20UDOO/Find_IP_Address">UDOO DUAL/QUAD’s IP</a> instead of localhost. So:

```bash

http://192.168.1.12/
http://192.168.1.12/phpmyadmin

```

If everything is all right, you did it!


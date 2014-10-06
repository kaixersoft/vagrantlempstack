# VAGRANT LEMP STACK
##### ( Shell provisioned  )

## Components
  * Ubuntu/trusty64  Box
  * Nginx
  * PHP
  * MySQL
  * PhpMyAdmin
  * Git

## Key Notes
  * Webroot : /var/www
  * Host sync folder : ./www
  * Private Ip : 192.168.11.11
  * Access MySql from host
    * Host : 192.168.11.11
    * Username : root
    * Password : root
  * Access PhpMyAdmin from host
    * URL : http://192.168.11.11/phpmyadmin
  * Show phpinfo from host browser
    * URL : http://192.168.11.11/info.php
  * Access you projects from host
    * Working Folder : ./www/<project_folder>
    * Project URL : http://192.168.11.11/<project_folder>


## What's good on this
  * Git deployment workflow
    * Work local  with the same environment as your production
    * Push production branch directly to your server from your local
    * Archieve sourcecode directly from local to your Github or Bitbucket repo
  * Dev Team uses the same environment
  * Quick and fast way to get LEMP stack on your machine


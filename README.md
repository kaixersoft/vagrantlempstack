# VAGRANT LEMP STACK
##### ( Shell provisioned  )

## How to use

#### Clone this repo
 ```
   git clone https://github.com/kaixersoft/vagrantlempstack.git
 ```

#### Working project folder ( web root )
 ```
   cd vagrantlempstack\www
   mkdir my_project	
 ```
   * Start working on your project (php,html)
   * Access your project url via : http://10.10.10.10/my_project/index.php
   * When your done, you can make your project folder a local git repo as well
 
 ```
  git init
  git add --all
  git commit -m "initial commit"
  git remote add prod ssh://<username>@producion_server/repo/myproject.git
  git push prod master
 ```

## Components

  * Ubuntu/trusty64  Box
  * Nginx
  * PHP
  * MySQL
  * PhpMyAdmin
  * Git
  * Mcrypt

## Key Notes

  * Webroot : /var/www
  * Host sync folder : www
  * Private Ip : 10.10.10.10

  * Access MySql from host
    * Host : 10.10.10.10
    * Username : root
    * Password : root

  * Access PhpMyAdmin from host
    * URL : http://10.10.10.10/phpmyadmin

  * Show phpinfo from host browser
    * URL : http://10.10.10.10/info.php

  * Access you projects from host
    * Working Folder : www/<project_folder>
    * Project URL : http://10.10.10.10/<project_folder>


## What's good on this
  * Git deployment workflow
    * Work local  with the same environment as your production
    * Push production branch directly to your server from your local
    * Archieve sourcecode directly from local to your Github or Bitbucket repo

  * Dev Team uses the same environment
  * Quick and fast way to get LEMP stack on your machine



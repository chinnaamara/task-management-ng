task-management-ng
==================

CONTENTS OF THIS FILE
---------------------
     * Introduction
     * Requirements
     * Installation
     * Configuration
     * Run

INTRODUCTION
------------
    The Task Management is a web application project to create your own projects
    and you can add other registered users as collaborators to project to work all together.
    Collaborate with users within the projects. You can create tasks and issues
    to assign to your self or to collaborated user.
     * For all you need to do is, visit the project page:
       https://taskmanagement.firebaseapp.com/
     * Create your user account through sign up
     * Login with your user credentials
     * Do create your own projects.

REQUIREMENTS
------------
    * AngularJS
    * Angular-ui-router
    * Firebase
    * Angularfire
    * Firebase-Simple-Login
    * Grunt
    * Bower

INSTALLATIONS
-------------
    * Initially first u should install node
        $ sudo apt-get install nodejs
    * $ npm install -g grunt
    * $ npm install -g bower
    * Download project or Clone project using git
    * Go to project path in terminal/cli
    * Run the below commands
        $ bower install
         or
        $ bower install jquery lodash bootstrap angular angular-ui-router firebase angularfire firebase-simple-login

        $ npm install

CONFIGURATION
-------------
    * Check bower_components folder whether all are installed or not
    * Check packeage.json file whether all npm packages are installed or not
    * Check Gruntfile.coffee
RUN
---
    * Go to project path in terminal/cli
    * $ grunt build    --> for first time to generate build folder as well as to run the app
    * $ grunt   --> later for every time to run app.

module.exports = (grunt) ->
  (require 'load-grunt-tasks')(grunt)

  grunt.registerTask 'default', ['concurrent:default']
  grunt.registerTask 'build', ['concurrent:lib']

  grunt.initConfig
    coffee:
      compileJoined:
        options:
          join: true
        files:
          'build/js/app.js': 'app/src/**/*.coffee'

    jade:
      compile:
        expand: true
        cwd: 'app/src/jade'
        src: ['**/*.jade']
        dest: 'build/html/'
        ext: '.html'

    cssmin:
      combine:
        files:
          'build/css/lib.min.css' : [
            'bower_components/bootstrap/dist/css/bootstrap.min.css',
            'bower_components/bootstrap/dist/css/bootstrap-theme.min.css'
          ],
          'build/css/all.min.css' : 'app/src/**/*.css'

    copy:
      main:
<<<<<<< HEAD
        src: ['bower_components/bootstrap/dist/fonts/*']
        expand: true
        dest: 'build/fonts/'
=======
        flatten: true
        src: ['bower_components/bootstrap/dist/fonts/*']
        expand: true
        dest: 'build/fonts/fonts/'
>>>>>>> e143de0fc58f0c287949ccf44faa2793d9807259


    concat:
      options:
        separator: ';'
      dist:
        src: ['bower_components/jquery/dist/jquery.js',
              'bower_components/bootstrap/dist/js/bootstrap.js',
              'bower_components/lodash/dist/lodash.compat.js'
              'bower_components/angular/angular.js',
              'bower_components/angular-ui-router/release/angular-ui-router.js',
              'bower_components/restangular/dist/restangular.js'
              'bower_components/ng-table/ng-table.js'
              'bower_components/Faker/Faker.js'
        ]
        dest: 'build/js/lib.min.js'

    karma:
      spec:
        configFile: 'karma.conf.js'
        autoWatch: true

    connect:
      server:
        options:
          port: 9000
<<<<<<< HEAD
          base: ['build/html', 'build/js', 'build/css', 'vendor']
=======
          base: ['build/html', 'build/js', 'build/css', 'build/fonts']
>>>>>>> e143de0fc58f0c287949ccf44faa2793d9807259
          keepalive: true
          livereload: true

    watch:
      jade:
        files: ['app/src/jade/**/*.jade']
        tasks: ['jade']

      coffee:
        files: ['app/src/coffee/**/*.coffee']
        tasks: ['coffee']

      css:
        files: ['app/src/css/**/*.css']
        tasks: ['cssmin']

      options:
        spawn: true
        livereload: true

    concurrent:
      default: ['jade', 'coffee', 'copy', 'connect', 'watch']
      lib: ['concat', 'cssmin', 'copy', 'jade', 'coffee', 'connect', 'watch']
      options:
        logConcurrentOutput: true

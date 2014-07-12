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
        src: ['bower_components/bootstrap/dist/fonts/*']
        expand: true
        dest: 'build/fonts/'


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
          base: ['build/html', 'build/js', 'build/css', 'vendor']
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
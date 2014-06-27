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

    concat:
      options:
        separator: ';'
      dist:
        src: ['bower_components/angular/angular.min.js',
              'bower_components/angular-ui-router/release/angular-ui-router.min.js',
              'bower_components/jquery/dist/jquery.min.js',
              'bower_components/lodash/dist/lodash.compat.min.js',
              'bower_components/restangular/dist/restangular.min.js'
        ]
        dest: 'build/js/lib.min.js'

    karma:
      spec:
        configFile: 'karma.conf.js'
        autoWatch: true

    connect:
      server:
        options:
          port: 9001,
          base: ['build/html']
          keepalive: true
          livereload: true

    watch:
      scripts:
        files: ['app/src/**/*.coffee']
        tasks: ['coffee']

    concurrent:
      default: ['jade','connect', 'watch']
      lib: ['concat']
      options:
        logConcurrentOutput: true

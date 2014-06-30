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
        src: ['bower_components/jquery/dist/jquery.js',
              'bower_components/lodash/dist/lodash.compat.js',
              'bower_components/angular/angular.js',
              'bower_components/angular-ui-router/release/angular-ui-router.js',
              'bower_components/restangular/dist/restangular.js'
        ]
        dest: 'build/js/lib.min.js'
    cssmin:
      combine:
        files:
          'build/css/lib.min.css': ['bower_components/**/**/css/*.css'],
          'build/css/all.min.css':['app/src/**/*.css']
    karma:
      spec:
        configFile: 'karma.conf.js'
        autoWatch: true

    connect:
      server:
        options:
          port: 9001,
          base: ['build/html','build/js','build/css','src/jade', 'src/coffee', 'src/css']
          keepalive: true
          livereload: true

    watch:
      scripts:
        files: ['app/src/**/*.jade', 'app/src/**/*.coffee']
        tasks: ['jade','coffee']
      options:
        spawn:true
        livereload:true

    concurrent:
      default: ['jade','connect', 'watch', 'newer:cssmin']
      lib: ['concat']
      options:
        logConcurrentOutput: true

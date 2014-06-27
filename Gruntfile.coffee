module.exports = (grunt) ->
  (require 'load-grunt-tasks')(grunt)

  grunt.registerTask 'default', ['concurrent:default']

  grunt.initConfig
    coffee:
      compileJoined:
        options:
          join: true
        files:
          'build/app.js': 'app/src/**/*.coffee'

    jade:
      compile:
        expand: true
        cwd: 'app/src/jade'
        src: ['**/*.jade']
        dest: 'build/html/'
        ext: '.html'

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
      options:
        logConcurrentOutput: true

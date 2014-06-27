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

    karma:
      spec:
        configFile: 'karma.conf.js'
        autoWatch: true

    connect:
      server:
        options:
          port: 9001,
          base: ['build']
          keepalive: true

    watch:
      scripts:
        files: ['app/src/**/*.coffee']
        tasks: ['coffee']

    concurrent:
      default: ['connect', 'watch']
      options:
        logConcurrentOutput: true

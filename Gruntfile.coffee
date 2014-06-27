module.exports = (grunt) ->
  (require 'load-grunt-tasks')(grunt)

  grunt.registerTask 'default', ['coffee']

  grunt.initConfig
    coffee:
      compileJoined:
        options:
          join: true
        files:
          'build/app.js': 'app/src/**/*.coffee'

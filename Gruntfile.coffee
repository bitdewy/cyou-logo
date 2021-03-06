'use strict';

module.exports = (grunt) ->
	grunt.initConfig
		pkg: grunt.file.readJSON("package.json")

		config:
			path:
				source: "source"
				build: "build"
		copy:
			static:
				files: [
					expand: true
					cwd: "<%= config.path.source %>"
					src: ["**/*.html", "**/*.png"]
					dest: "<%= config.path.build %>"
				]
			script:
				files: [
					expand: true
					cwd: "<%= config.path.source %>/js"
					src: ["**/*.js"]
					dest: "<%= config.path.build %>/js"
				]
		clean:
			build:
				files: [
					expand: true
					cwd: "<%= config.path.build %>"
					src: ["**"]
					dot: true
				]
		less:
			build:
				files: [
					expand: true
					cwd: "<%= config.path.source %>/less"
					src: ["*.less"]
					dest: "<%= config.path.build %>/css"
					ext: ".css"
				]

	grunt.loadNpmTasks "grunt-contrib-clean"
	grunt.loadNpmTasks "grunt-contrib-copy"
	grunt.loadNpmTasks "grunt-contrib-less"

	grunt.registerTask "default", [
		"clean:build", "less:build", "copy"
	]
	return

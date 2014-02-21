module.exports = (grunt) ->
	grunt.initConfig
		pkg: grunt.file.readJSON("package.json")

		config:
			path:
				source: "source"
				build: "build"
		copy:
			html:
				files: [
					expand: true
					cwd: "<%= config.path.source %>"
					src: ["*.html"]
					dest: "<%= config.path.build %>"
				]
		clean:
			build:
				files: [
					expand: true
					cwd: "<%= config.path.build %>"
					src: ["**/*"]
					dot: true
				]
		less:
			build:
				files: [
					expand: true
					cwd: "<%= config.path.source %>/styles"
					src: ["*.less"]
					dest: "<%= config.path.build %>/styles"
					ext: ".css"
				]

	grunt.loadNpmTasks "grunt-contrib-clean"
	grunt.loadNpmTasks "grunt-contrib-copy"
	grunt.loadNpmTasks "grunt-contrib-less"

	grunt.registerTask "default", [
		"clean:build", "less:build", "copy:html"
	]
	grunt.registerTask "cleanup", [
		"clean:build"
	]
	return
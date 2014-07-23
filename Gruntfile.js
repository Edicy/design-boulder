module.exports = function(grunt) {
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-svgmin');
  grunt.loadNpmTasks('grunt-newer');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    concat: {
      build: {
        src: [
          'javascripts/src/jquery.js',
          'javascripts/src/*.js'
        ],
        dest: 'javascripts/application.js'
      }
    },

    uglify: {
      build: {
        files: [{
          expand: true,
          cwd: 'javascripts/',
          src: [
            '*.js',
            '!*.min.js'
          ],
          dest: 'javascripts/',
          ext: '.min.js'
        }]
      }
    },

    // sass: {
    //   build: {
    //     options: {
    //       style: 'expanded'
    //     },
    //     files: [{
    //       expand: true,
    //       cwd: 'stylesheets/sass',
    //       src: ['*.scss'],
    //       dest: 'stylesheets',
    //       ext: '.css'
    //     }]
    //   }
    // },

    cssmin: {
      build: {
        expand: true,
        cwd: 'stylesheets/',
        src: ['*.css', '!*.min.css'],
        dest: 'stylesheets/',
        ext: '.min.css',
        options: {
          spawn: false
        }
      }
    },

    imagemin: {
      images: {
        files: [{
          expand: true,
          cwd: 'images/src/',
          src: '*.{png,jpg,gif}',
          dest: 'images/'
        }]
      },

      photos: {
        files: [{
          expand: true,
          cwd: 'photos/src/',
          src: '*.{png,jpg,gif}',
          dest: 'photos/'
        }]
      }
    },

    svgmin: {
      build: {
        files: [{
          expand: true,
          cwd: 'assets/src/',
          src: '*.svg',
          dest: 'assets/',
          ext: '.svg'
        }]
      },
    },

    watch: {
      concat: {
        files: 'javascripts/src/*.js',
        tasks: 'concat'
      },

      uglify: {
        files: ['javascripts/*.js', '!javascripts/*.min.js'],
        tasks: 'newer:uglify',
        options: {
          spawn: false
        }
      },

      css: {
        files: 'stylesheets/sass/*.scss',
        // tasks: ['sass', 'cssmin'],
        tasks: 'newer:cssmin',
        options: {
          spawn: false
        }
      }
    },
  });

  // grunt.registerTask('default', ['concat', 'uglify', 'sass', 'cssmin', 'imagemin', 'svgmin']);
  grunt.registerTask('default', ['concat', 'uglify', 'cssmin', 'imagemin', 'svgmin']);

  grunt.registerTask('dev', ['watch']);
};

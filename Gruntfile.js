module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    // Copys the source files from the bower directory to the project's source locations.
    bowercopy: {
      options: {
        srcPrefix: 'bower_components'
      },

      javascripts: {
        options: {
          destPrefix: 'javascripts/src/'
        },
        files: {
          'concat/global/jquery.js': 'jquery/dist/jquery.js',
          'concat/global/overthrow.js': 'overthrow/src/overthrow-polyfill.js',
          'concat/blog-and-news/moment-with-locales.js': 'moment/min/moment-with-locales.js',
          'modernizr.js': 'modernizr/modernizr.js'
        }
      },

      stylesheets: {
        options: {
          destPrefix: 'stylesheets/scss/'
        },
        files: {
          'bourbon': 'bourbon/dist'
        }
      }
    },

    // Builds custom modernizr script.
    modernizr: {
      build: {
        'devFile' : 'javascripts/src/modernizr.js',
        'outputFile' : 'javascripts/modernizr.js',

        'tests': [
          'flexbox',
          'svg'
        ],

        'uglify' : false
      }
    },

    // Copys the standalone (not concatenated) javascript source files to the javascripts folder.
    copy: {
      javascripts: {
        files: [
          {
            expand: true,
            cwd: 'javascripts/src',
            src: [
              '*.js',
              '!modernizr.js'
            ],
            dest: 'javascripts/'
          }
        ]
      }
    },

    // Concatenates the javascript source files to the javascripts folder.
    concat: {
      build_global: {
        src: [
          'javascripts/src/concat/global/jquery.js',
          'javascripts/src/concat/global/*.js'
        ],
        dest: 'javascripts/global.js'
      },

      build_blog_and_news: {
        src: [
          'javascripts/src/concat/blog-and-news/moment-with-locales.js',
          'javascripts/src/concat/blog-and-news/*.js'
        ],
        dest: 'javascripts/blog-and-news.js'
      },
    },

    // Minifies the javascript files.
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

    // Compiles the stylesheet files.
    sass: {
      build: {
        options: {
          style: 'expanded',
          sourcemap: 'none'
        },
        files: [{
          expand: true,
          cwd: 'stylesheets/scss',
          src: '*.scss',
          dest: 'stylesheets',
          ext: '.css'
        }]
      }
    },

    // Minifies the stylesheet files.
    cssmin: {
      build: {
        expand: true,
        cwd: 'stylesheets/',
        src: [
          '*.css',
          '!*.min.css'
        ],
        dest: 'stylesheets/',
        ext: '.min.css'
      }
    },

    // Minifies the image files.
    imagemin: {
      build: {
        files: [{
          expand: true,
          cwd: 'images/src/',
          src: '*.{png,jpg,gif}',
          dest: 'images/'
        }]
      }
    },

    // Minifies the scalable vector graphics files
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

    // Watches the project for changes and recompiles the output files.
    watch: {
      concat: {
        files: [
          'javascripts/src/concat/global/*.js',
          'javascripts/src/concat/blog-and-news/*.js',
        ],
        tasks: 'newer:concat'
      },

      uglify: {
        files: [
        'javascripts/*.js',
        '!javascripts/*.min.js'
        ],
        tasks: 'uglify',
        options: {
          spawn: false
        }
      },

      css: {
        files: 'stylesheets/scss/*.scss',
        tasks: ['sass:build', 'cssmin:build'],
        options: {
          spawn: false
        }
      }
    },
  });

  grunt.loadNpmTasks('grunt-bowercopy');
  grunt.loadNpmTasks('grunt-modernizr');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-svgmin');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-newer');

  grunt.registerTask('default', ['bowercopy', 'modernizr', 'copy', 'concat', 'uglify', 'sass', 'cssmin', 'imagemin', 'svgmin']);
};

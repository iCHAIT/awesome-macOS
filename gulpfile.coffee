###############################################################################
## Autoload gulp plugins
###############################################################################

gulp = require 'gulp'
gulpLoadPlugins = require 'gulp-load-plugins'
plugins = gulpLoadPlugins
  pattern: [
    'gulp-*'
    'gulp.*'
    'del'
    'main-bower-files'
    'nib'
    'rupture'
    'jeet'
  ]
browserSync = require 'browser-sync'
  .create()


###############################################################################
## Source files and folders
###############################################################################

paths =
  images:
    svg:
      input: [
        'src/images/**/*.svg'
        '!src/images/css/**/*'
      ]
      icons: 'src/images/icons/**/*.svg'
      output: 'src/stylus'
  jade:
    input: 'src/jade/**/*.jade'
    output: 'dist'
  styles:
    input: 'src/stylus/**/*.styl'
    output: 'dist/css'
  js:
    main:
      input: 'src/javascript/**/*.coffee'
      output: 'dist/javascript'


###############################################################################
## Jade templates
###############################################################################

gulp.task 'jade', ->
  return gulp.src paths.jade.input
    .pipe plugins.changed paths.jade.output, extension: '.html'
    .pipe plugins.plumber
      derrorHandler: (error) ->
        plugins.util.log '(ERROR)', error.message
        plugins.util.beep()
      errorHandler: plugins.notify.onError "Error: <%= error.message %>"
    .pipe plugins.jade
      pretty: true
    .pipe gulp.dest paths.jade.output


###############################################################################
## Process CoffeeScript
###############################################################################

gulp.task 'javascript', ->
  jsFiles = plugins.mainBowerFiles({base: './bower_components', filter: /.*\.js$/i})
  jsFiles.push 'src/javascript/*.js'
  coffeeFilter = plugins.filter 'main.coffee'
  return gulp
    .src paths.js.main.input
    .pipe plugins.plumber
      derrorHandler: (error) ->
        plugins.util.log '(ERROR)', error.message
        plugins.util.beep()
      errorHandler: plugins.notify.onError "Error: <%= error.message %>"
    .pipe plugins.sourcemaps.init()
    .pipe plugins.coffee()
    .pipe plugins.addSrc.prepend jsFiles
    .pipe plugins.concat 'bundle.js'
    # .pipe plugins.uglify()
    .pipe plugins.rename
      suffix: '.min'
    .pipe plugins.sourcemaps.write('../maps')
    .pipe gulp.dest paths.js.main.output


###############################################################################
## Process SVG icons
###############################################################################

gulp.task 'icons', ->
  svgFilter = plugins.filter '*.svg'
  gulp.src paths.images.svg.icons
    .pipe plugins.svgSymbols
      title: false
    .pipe plugins.filter '*.svg'
    .pipe plugins.replace /fill=\"(.*)\"/g, 'fill="param(fill) $1"'
    .pipe gulp.dest 'dist'


###############################################################################
## Stylus
###############################################################################

gulp.task 'stylus', ['icons'], ->
  gulp.src paths.styles.input
    .pipe plugins.plumber
      derrorHandler: (error) ->
        plugins.util.log '(ERROR)', error.message
        plugins.util.beep()
      errorHandler: plugins.notify.onError "Error: <%= error.message %>"
    .pipe plugins.sourcemaps.init()
    .pipe plugins.stylus
      use: [
        plugins.nib()
        plugins.jeet()
        plugins.rupture()
      ]
      'include css': true
    .pipe plugins.minifyCss()
    .pipe plugins.sourcemaps.write('../maps')
    .pipe gulp.dest paths.styles.output
    .pipe browserSync.stream
      match: '**/*.css'


###############################################################################
## BrowserSync
###############################################################################

gulp.task 'jade-watch', ['jade'], ->
  browserSync.reload()
  return

gulp.task 'js-watch', ['javascript'], ->
  browserSync.reload()
  return

gulp.task 'browser-sync', ['jade'], ->
  browserSync.init
    server:
      baseDir: 'dist'
    injectChanges: true
    open: false
    ghostMode: false
    notify: false

  gulp.watch(paths.jade.input, ['jade-watch'])
  gulp.watch paths.js.main.input, ['js-watch']
  gulp.watch 'bower_components/**/*', ['js-watch']
  gulp.watch paths.styles.input, ['stylus']
  gulp.watch paths.images.svg.icons, ['icons']


###############################################################################
## Default task
###############################################################################

gulp.task 'default', [
  'jade'
  'javascript'
  'icons'
  'stylus'
  'browser-sync'
]


###############################################################################
## Build task
###############################################################################

gulp.task 'build', [
  'jade'
  'javascript'
  'icons'
  'stylus'
]


###############################################################################
## Make a clean slate
###############################################################################

gulp.task 'clean', ->
  plugins.del [
    'dist/*/**'
    'src/stylus/sprite*.styl'
  ]


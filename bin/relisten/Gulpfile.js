'use strict';

/**
 * Documentation for Gulp with Browserify:
 *  - https://github.com/gulpjs/gulp/tree/master/docs/recipes
 */

var gulp       = require('gulp'),
    gutil      = require('gulp-util'),
    uglify     = require('gulp-uglify'),
    sourcemaps = require('gulp-sourcemaps'),
    concat     = require('gulp-concat'),
    connect    = require('gulp-connect'),
    zip        = require('gulp-zip'),
    browserify = require('browserify'),
    source     = require('vinyl-source-stream'),
    buffer     = require('vinyl-buffer'),
    del        = require('del');

var paths = {
    html: './app/index.html',
    js: './app/js/**/*.js',
    app: './app/js/browserApp.js',
    dist: './dist',
};

gulp.task('clean', function() {
    return del(['dist']);
});

gulp.task('js', function () {
    var b = browserify({
        entries: paths.app, // Entrypoint of Browserify
        debug: true,
        transform: [],
    });

    b.bundle()
        .pipe(source('app.js')) // Result of Browserify
        .pipe(buffer())
        .pipe(sourcemaps.init({ loadMaps: true }))
            .pipe(uglify())
            .on('error', gutil.log)
        .pipe(sourcemaps.write())
        .pipe(gulp.dest(paths.dist))
        .pipe(connect.reload());
});

gulp.task('style', function() {
    // gulp.src(paths.scss)
    gulp.src(['./node_modules/pickadate/lib/themes/default.css',  './node_modules/pickadate/lib/themes/default.date.css'])
        .pipe(sourcemaps.init({ loadMaps: true }))
        .pipe(concat('style.css'))
        .pipe(sourcemaps.write())
        .pipe(gulp.dest(paths.dist))
        .pipe(connect.reload());
});

gulp.task('html', function() {
    gulp.src(paths.html)
        .pipe(gulp.dest(paths.dist))
        .pipe(connect.reload());
});

gulp.task('webserver', function() {
    connect.server({
        root: './dist',
        fallback: './dist/index.html',
        livereload: true
    });
});

gulp.task('zip', function () {
    gulp.src(paths.dist)
        .pipe(zip('archive.zip'))
        .pipe(gulp.dest('./'));
});

gulp.task('default', ['clean', 'webserver', 'html', 'style', 'js']);

gulp.watch(paths.html, ['html']);
gulp.watch(paths.scss, ['style']);
gulp.watch(paths.js, ['js']);

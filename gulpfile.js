// https://gist.github.com/JacyAnderson/144e9eb6b0bac865941ef913abc647cf

// -------------------- Configuration Settings --------------------
var config = {};

//basics
config.siteName = 'Inlog Systeem';
config.proxyDomain = 'inlog.local';

//source directory
config.src = 'src/';

//destinations
config.dest = 'public_html/public/';
config.destJS = config.dest + 'js';
config.destCSS = config.dest + 'css';

//globs
config.globs = {
    scss: config.src + 'scss/**/*.scss',
    js: {
        main: config.src + "js/individual/main.js",
        individual: config.src + 'js/individual/**/*.js',
        includes: config.src + 'js/includes/**/*.js'
    },
    watched: [
        config.destJS + '/**/*.min.js',
        config.destCSS + '/**/*.min.css'
    ]
};

//browser sync
config.browserSync = {
    files: config.globs.watched,
    proxy: config.proxyDomain,
    open: false
};

// -------------------- Require Statements --------------------
const gulp = require('gulp'),
    autoprefixer = require('gulp-autoprefixer'),
    livereload = require('gulp-livereload'),
    browserSync = require('browser-sync').create(),
    newer = require('gulp-newer'),
    include = require('gulp-include'),
    notify = require('gulp-notify'),
    plumber = require('gulp-plumber'),
    rename = require('gulp-rename'),
    sass = require('gulp-dart-sass'),
    size = require('gulp-size'),
    uglify = require('gulp-uglify-es').default,
    watch = require('gulp-watch'),
    path = require('path'),
    cleanCss = require('gulp-clean-css'),
    sourcemaps = require('gulp-sourcemaps'),
    lazypipe = require('lazypipe'),
    fs = require('fs'),
    del = require("del");

// -------------------- Notification Icon Detection --------------------
/**
 * Checks to see if a file exists.
 *
 * @param filePath
 * @returns {*}
 */
function fileExists(filePath) {
    try {
        return fs.statSync(filePath).isFile();
    } catch (err) {
        return false;
    }
}

var iconPath = path.join(__dirname, 'gulp.png');
var icon = fileExists(iconPath) ? iconPath : null;

// -------------------- Plumber Error Handler --------------------
const plumberErrorHandler = function (err) {
    notify.onError({
        title: "Gulp error in " + err.plugin,
        message: err.toString()
    })(err);
    this.emit('end');
};

// -------------------- Processors --------------------
// Javascript compiling
const jsIndividualScripts = lazypipe()
    .pipe(plumber)
    .pipe(include)
    .pipe(newer, {dest: config.destJS, ext: '.min.js'})
    .pipe(gulp.dest, config.destJS)
    .pipe(size, {showFiles: true})
    .pipe(uglify)
    .pipe(rename, {suffix: '.min'})
    .pipe(gulp.dest, config.destJS)
    .pipe(size, {showFiles: true});

const jsMain = () => {
    return gulp.src(config.globs.js.main, {
        allowEmpty: true
    })
        .pipe(plumber({errorHandler: plumberErrorHandler}))
        .pipe(include())
        .pipe(newer({dest: config.destJS, ext: '.min.js'}))
        .pipe(gulp.dest(config.destJS))
        .pipe(size({showFiles: true}))
        .pipe(uglify())
        .pipe(rename({suffix: '.min'}))
        .pipe(gulp.dest(config.destJS))
        .pipe(size({showFiles: true}));
}

const jsIndividual = () => {
    return gulp.src(config.globs.js.individual, {
        allowEmpty: true
    })
        .pipe(plumber({errorHandler: plumberErrorHandler}))
        .pipe(include())
        .pipe(newer({dest: config.destJS, ext: '.min.js'}))
        .pipe(gulp.dest(config.destJS))
        .pipe(size({showFiles: true}))
        .pipe(uglify())
        .pipe(rename({suffix: '.min'}))
        .pipe(gulp.dest(config.destJS))
        .pipe(size({showFiles: true}));
}

const scss = () => {
    return gulp.src(config.globs.scss, {
        allowEmpty: true
    })
        .pipe(plumber({errorHandler: plumberErrorHandler}))
        .pipe(sass(), {outputStyle: ':compact'})
        .pipe(autoprefixer(), 'last 2 version')
        .pipe(gulp.dest(config.destCSS))
        .pipe(size({showFiles: true}))
        .pipe(rename({suffix: '.min'}))
        .pipe(sourcemaps.init())
        .pipe(cleanCss())
        .pipe(sourcemaps.write('.'))
        .pipe(gulp.dest(config.destCSS))
        .pipe(size({showFiles: true}));
}

// -------------------- Tasks --------------------
// Build-styles task
gulp.task('build-styles', function (done) {
    if (browserSync.active) {
        return scss()
            .pipe(browserSync.reload({stream: true}));
    }
    done();
    return scss();
});

// Build-js task
gulp.task('build-js', function (done) {
    if (browserSync.active) {
        return gulp.src(config.globs.scss, { allowEmpty: true})
            .pipe(jsIndividualScripts())
            .pipe(browserSync.reload({stream: true}));
    }

    done();
    return jsMain();
});

gulp.task('build-individual-js', (done) => {
    done();
    return jsIndividual()
});

// Del js build files in public
gulp.task('del-js-build', function (done) {
    done();
    return del([config.destJS + '/main.min.js', config.destJS + '/main.js']);
});

gulp.task('live', function () {
    // Start livereload
    livereload.listen();

    // Watch all .scss files
    watch(config.globs.scss, gulp.series('build-styles'));

    // Watch each individual .js file
    watch(config.globs.js.individual, gulp.series('build-individual-js'));

    // Watch included .js files and compile main.js on change
    watch(config.globs.js.includes, gulp.series('del-js-build', 'build-js'));

    // Watch for changes on transpired css, and js files
    watch(config.globs.watched, (event) => {
        gulp.src(event.path, {allowEmpty: true})
            .pipe(plumber({errorHandler: plumberErrorHandler}))
            .pipe(livereload())
            .pipe(notify({
                    title: config.siteName,
                    message: event.path.replace(__dirname, '').replace(/\\/g, '/') + ' was reloaded'
                    , sound: 'Pop'
                    , icon: icon
                })
            );
    });
});

// Start browser-sync server
gulp.task('serve-bs', gulp.series('live', () => {
    browserSync.init(config.browserSync);
}));

// Start livereload
gulp.task('serve-lr', gulp.series('live'));

var express = require('express');
var path = require('path');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

var routes = require('./routes/index');

var app = express();

// Serve the Parse API on the /parse URL prefix
var parse = require('./parse/api')
app.use('/parse', parse);
app.ParseServer = parse

//Serve the Parse Dashboard on the /dashboard URL prefix
var dashboard = require('./parse/dashboard')
app.use('/dashboard', dashboard);

//Socket.io
// uncomment if you want to use it
// app.io = require('socket.io')()
// require('./sockets/sockets.js')(app.io)

// Serve static assets from the /public folder
app.use('/public', express.static(path.join(__dirname, '/public')));

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');


app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', routes);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.send(err)
  });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
  res.status(err.status || 500);
  res.send(err.message)
});

module.exports = app;

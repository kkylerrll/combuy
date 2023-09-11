var express = require('express');
var app = express();
var path = require('path');
var bodyParser = require('body-parser');
var routes = require('./router');
var session = require('express-session');

app.use(session({
    secret: 'hello-kyler',
    resave: false,
    saveUninitialized: false,

    cookie:{
        path: '/',
        httpOnly: true,
        secure: false,
        maxAge: 10 * 60 * 1000
    },

}));

app.use(function(req, res, next) {
    res.locals.session = req.session;
    next();
});

app.use(express.static(path.join(__dirname, 'public')));
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));
app.use(bodyParser.urlencoded({ extended: true }));

app.use('/', routes); // 使用路由


app.listen(3000, function () {
    console.log('Server is listening on port 3000');
});
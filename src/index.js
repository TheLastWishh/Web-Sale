const path = require('path');
const express = require('express');
const app = express();
const handlebars = require('express-handlebars');
const engine = handlebars.engine;
const session = require('express-session');
const cookieParser = require('cookie-parser');
const port = 3000;

const route = require('./routes');

// Set up views engine Handlebars
app.engine(
    'hbs',
    engine({
        extname: '.hbs',
    })
);
app.set('view engine', 'hbs');
app.set('views', path.join(__dirname, 'resources/views'));

// Config static files
app.use(express.static(path.join(__dirname, 'public')));

// Handle Data
app.use(express.urlencoded({extended: true}));
app.use(express.json());

// Cookies
app.use(cookieParser());

// Session
app.use(
    session({
        secret: 'secret',
        resave: true,
        saveUninitialized: true,
        cookie: {maxAge: 1200000},
    })
);

// Routes init
route(app);

app.listen(port, () => {
    console.log(`App listening on port ${port}`);
});

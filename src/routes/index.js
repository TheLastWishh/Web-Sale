const siteRouter = require('./site');
const userRouter = require('./user');
const storeRouter = require('./store');

function route(app) {
    app.use('/', siteRouter);
    app.use('/user', userRouter);
    app.use('/store', storeRouter);
}

module.exports = route;

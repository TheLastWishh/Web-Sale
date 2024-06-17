const siteRouter = require('./site');
const userRouter = require('./user');
const storeRouter = require('./store');
const cartRouter = require('./cart');

function route(app) {
    app.use('/', siteRouter);
    app.use('/user', userRouter);
    app.use('/store', storeRouter);
    app.use('/cart', cartRouter);
}

module.exports = route;

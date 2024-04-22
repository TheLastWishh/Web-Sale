const siteRouter = require('./site')
const userRouter = require('./user')

function route(app) {
    app.use('/', siteRouter)
    app.use('/user', userRouter)
}

module.exports = route

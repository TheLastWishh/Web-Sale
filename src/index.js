const path = require('path')
const express = require('express')
const app = express()
const handlebars = require('express-handlebars')
const route = require('./routes')
const engine = handlebars.engine
const port = 3000

// Set up views engine Handlebars
app.engine(
    'hbs',
    engine({
        extname: '.hbs',
    })
)
app.set('view engine', 'hbs')
app.set('views', path.join(__dirname, 'resources/views'))

// Routes init
route(app)

// Config CSS
app.use(express.static(path.join(__dirname, 'public')))

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})

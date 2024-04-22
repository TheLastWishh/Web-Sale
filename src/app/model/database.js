const mysql = require('mysql')

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '1111',
    database: 'electrohub',
})

db.connect(function (err) {
    if (err) {
        console.log('Database is failed to connect', err)
        return
    }
    console.log(
        'Database is connected successfully \nServer is running on port localhost:3000 '
    )
})

module.exports = db

const db = require('./database')

function checkEmail(email) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT * from user WHERE email = ?`
        db.query(sql, [email], (err, result) => {
            if (err) {
                reject(err)
            } else {
                resolve(result[0])
            }
        })
    })
}

function checkUsername(username) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT * from user WHERE username = ?`
        db.query(sql, [username], (err, result) => {
            if (err) {
                reject(err)
            } else {
                resolve(result[0])
            }
        })
    })
}

function checkUserID(userID) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT * from user WHERE username = ?`
        db.query(sql, [userID], (err, result) => {
            if (err) {
                reject(err)
            } else {
                resolve(result[0])
            }
        })
    })
}

async function generateID() {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

    while (true) {
        let randomLetters = ''
        for (let i = 0; i < 2; i++) {
            const randomIndex = Math.floor(Math.random() * letters.length)
            randomLetters += letters[randomIndex]
        }

        const randomNumber = Math.floor(10000000 + Math.random() * 90000000)
        const generateID = randomLetters + randomNumber.toString()

        // checkUserID(generateID)
        //     .then((result) => {
        //         if (result) {
        //             return generateID()
        //         } else {
        //             return generateID
        //         }
        //     })
        //     .catch((err) => {
        //         throw err
        //     })
        try {
            const result = await checkUserID(generateID)
            
            if (!result) {
                return generateID
            }
        } catch (error) {
            throw error
        }
    }
}

module.exports = {checkEmail, checkUsername, generateID}

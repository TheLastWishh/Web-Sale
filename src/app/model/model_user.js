const db = require('./database');

function checkEmail(email) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT * from user WHERE email = ?`;
        db.query(sql, [email], (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result[0]);
            }
        });
    });
}

function checkUsername(username) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT * from user WHERE username = ?`;
        db.query(sql, [username], (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result[0]);
            }
        });
    });
}

function checkUserID(userID) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT * from user WHERE username = ?`;
        db.query(sql, [userID], (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result[0]);
            }
        });
    });
}

async function generateID() {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    while (true) {
        let randomLetters = '';
        for (let i = 0; i < 2; i++) {
            const randomIndex = Math.floor(Math.random() * letters.length);
            randomLetters += letters[randomIndex];
        }

        const randomNumber = Math.floor(10000000 + Math.random() * 90000000);
        const generateID = randomLetters + randomNumber.toString();

        try {
            const result = await checkUserID(generateID);

            if (!result) {
                return generateID;
            }
        } catch (error) {
            throw error;
        }
    }
}

getAllPurchaseOrders = async () => {
    try {
        let sql = `SELECT * FROM purchaseorder ORDER BY OrderDate ASC`;
        const listOrders = await new Promise((resolve, reject) => {
            db.query(sql, (err, result) => {
                if (err) {
                    return reject(err);
                }
                resolve(result);
            });
        });

        return listOrders;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

module.exports = {checkEmail, checkUsername, generateID, getAllPurchaseOrders};

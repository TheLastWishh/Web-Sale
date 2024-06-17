const CartController = require('../controllers/CartController');
const db = require('./database');

exports.getCartInfo = async (userID) => {
    try {
        let sql1 = `SELECT * FROM shoppingcart WHERE userID = ?`;
        const cartInfo = await new Promise((resolve, reject) => {
            db.query(sql1, [userID], (err, result) => {
                if (err) {
                    return reject(err);
                }
                if (result.length === 0) {
                    return reject(new Error('Không tìm thấy thông tin giỏ hàng'));
                }
                resolve(result[0]);
            });
        });

        let sql2 = `SELECT * FROM cartitems WHERE ShoppingCartID = ?`;
        const cartItems = await new Promise((resolve, reject) => {
            db.query(sql2, [cartInfo.ShoppingCartID], (err, result) => {
                if (err) {
                    return reject(err);
                }
                resolve(result);
            });
        });

        for (let index = 0; index < cartItems.length; index++) {
            const item = cartItems[index];
            const productInfo = await new Promise((resolve, reject) => {
                let sql3 = `SELECT ProductName, ImgProduct, Price FROM product WHERE ProductID = ?`;
                db.query(sql3, [item.ProductID], (err, result) => {
                    if (err) {
                        return reject(err);
                    }
                    resolve(result[0]);
                });
            });
            cartItems[index] = Object.assign(item, productInfo);
            cartItems[index].TotalPrice = item.QuantityProduct * productInfo.Price;
        }

        cartInfo.cartItems = cartItems;

        return cartInfo;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

exports.checkProductInCart = (cartItems, productID) => {
    return cartItems.find((item) => item.ProductID === productID);
};

exports.generateID = async () => {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    let randomLetters = '';
    for (let i = 0; i < 2; i++) {
        const randomIndex = Math.floor(Math.random() * letters.length);
        randomLetters += letters[randomIndex];
    }

    const randomNumber = Math.floor(10000000 + Math.random() * 90000000);
    const generateID = randomLetters + randomNumber.toString();

    return generateID;
};

exports.getPurchaseOrderInfo = async (purchasrOrderID) => {
    try {
        let sql1 = `SELECT * FROM purchaseorder WHERE PurchaseOrderID = ?`;
        const purchaseOrderInfo = await new Promise((resolve, reject) => {
            db.query(sql1, [purchasrOrderID], (err, result) => {
                if (err) {
                    return reject(err);
                }
                resolve(result[0]);
            });
        });

        let sql2 = `SELECT * FROM purchaseorderdetail WHERE PurchaseOrderID = ?`;
        const purchaseOrderDetails = await new Promise((resolve, reject) => {
            db.query(sql2, [purchasrOrderID], (err, result) => {
                if (err) {
                    return reject(err);
                }
                resolve(result);
            });
        });

        for (let index = 0; index < purchaseOrderDetails.length; index++) {
            const item = purchaseOrderDetails[index];
            const productInfo = await new Promise((resolve, reject) => {
                let sql3 = `SELECT ProductName, ImgProduct FROM product WHERE ProductID = ?`;
                db.query(sql3, [item.ProductID], (err, result) => {
                    if (err) {
                        return reject(err);
                    }
                    resolve(result[0]);
                });
            });
            purchaseOrderDetails[index] = Object.assign(item, productInfo);
        }

        purchaseOrderInfo.purchaseOrderDetails = purchaseOrderDetails;

        return purchaseOrderInfo;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

const modelCart = require('../model/model_cart');
const modelStore = require('../model/model_store');
const modelUser = require('../model/model_user');
const db = require('../model/database');

class CartController {
    async addOne(req, res, next) {
        let productName = req.params.productName;
        let productDetails = await modelStore.getProductDetails(productName);
        if (!req.session.User) {
            req.session.back = `/store/${productDetails.ProductCategoryName}`;
            res.redirect('/user/sign-in');
        } else {
            let cartInfo = await modelCart.getCartInfo(req.session.User.id);
            let cartItems = cartInfo.cartItems;
            let totalPrice = cartInfo.TotalPrice + productDetails.Price;
            let isProductInCart = modelCart.checkProductInCart(cartItems, productDetails.ProductID);

            try {
                let sql1 = `UPDATE shoppingcart SET totalPrice = ? WHERE ShoppingCartID = ?`;
                db.query(sql1, [totalPrice, cartInfo.ShoppingCartID]);
                if (isProductInCart) {
                    let sql2 = 'UPDATE cartitems SET QuantityProduct = ? WHERE ProductID = ?';
                    db.query(sql2, [isProductInCart.QuantityProduct + 1, productDetails.ProductID]);
                } else {
                    let sql2 = `INSERT INTO cartitems (ShoppingCartID, ProductID, QuantityProduct) VALUES (?, ?, ?)`;
                    db.query(sql2, [cartInfo.ShoppingCartID, productDetails.ProductID, 1]);
                }
            } catch (err) {
                console.error(err);
                throw err;
            }

            res.redirect(`/store/${productDetails.ProductCategoryName}`);
        }
    }

    async addMore(req, res, next) {
        let productName = req.params.productName;
        let quantity = req.body.quantity;
        quantity = parseInt(quantity);
        let productDetails = await modelStore.getProductDetails(productName);

        if (!req.session.User) {
            req.session.back = `/store/${productName}/details`;
            res.redirect('/user/sign-in');
        } else {
            let cartInfo = await modelCart.getCartInfo(req.session.User.id);
            let cartItems = cartInfo.cartItems;
            let totalPrice = cartInfo.TotalPrice + productDetails.Price * quantity;
            let isProductInCart = modelCart.checkProductInCart(cartItems, productDetails.ProductID);

            try {
                let sql1 = `UPDATE shoppingcart SET totalPrice = ? WHERE ShoppingCartID = ?`;
                db.query(sql1, [totalPrice, cartInfo.ShoppingCartID]);
                if (isProductInCart) {
                    let sql2 = 'UPDATE cartitems SET QuantityProduct = ? WHERE ProductID = ?';
                    db.query(sql2, [isProductInCart.QuantityProduct + quantity, productDetails.ProductID]);
                } else {
                    let sql2 = `INSERT INTO cartitems (ShoppingCartID, ProductID, QuantityProduct) VALUES (?, ?, ?)`;
                    db.query(sql2, [cartInfo.ShoppingCartID, productDetails.ProductID, quantity]);
                }
            } catch (err) {
                console.error(err);
                throw err;
            }

            res.redirect(`/store/${productName}/details`);
        }
    }

    async delete(req, res, next) {
        let productID = req.params.productID;

        try {
            let sql1 = `SELECT ShoppingCartID FROM shoppingcart WHERE UserID = ?`;
            const shoppingCartID = await new Promise((resolve, reject) => {
                db.query(sql1, [req.session.User.id], (err, result) => {
                    if (err) {
                        return reject(err);
                    }
                    resolve(result[0].ShoppingCartID);
                });
            });

            let sql2 = `DELETE FROM cartitems WHERE ShoppingCartID = ? AND ProductID = ?`;
            db.query(sql2, [shoppingCartID, productID]);

            res.redirect('/cart');
        } catch (err) {
            console.error(err);
            throw err;
        }
    }

    async showCart(req, res, next) {
        if (!req.session.User) {
            req.session.back = `/cart`;
            res.redirect('/user/sign-in');
        } else {
            let user = req.session.User;
            let cartInfo = await modelCart.getCartInfo(req.session.User.id);
            let cartItems = cartInfo.cartItems;

            res.render('cart/shopping-cart', {cartItems: cartItems, user: user});
        }
    }

    async checkOut(req, res, next) {
        if (!req.session.User) {
            res.redirect('/user/sign-in');
        } else {
            let user = req.session.User;
            let cartInfo = await modelCart.getCartInfo(req.session.User.id);
            let cartItems = cartInfo.cartItems;
            let listOrderedProductID = req.body.productID;
            let orderedItems = cartItems.filter((item) => listOrderedProductID.includes(item.ProductID));
            let totalAmount = orderedItems.reduce((accumulator, item) => accumulator + item.TotalPrice, 0);
            res.render('cart/checkout', {user: req.session.User, orderedItems: orderedItems, totalAmount: totalAmount, user: user});
        }
    }

    async order(req, res, next) {
        let purchaseID = await modelCart.generateID();
        let cartInfo = await modelCart.getCartInfo(req.session.User.id);
        let cartItems = cartInfo.cartItems;
        let listOrderedProductID = req.body.productID;
        let orderedItems = cartItems.filter((item) => listOrderedProductID.includes(item.ProductID));
        let totalAmount = orderedItems.reduce((accumulator, item) => accumulator + item.TotalPrice, 0);
        let payment = req.body.payment;
        let dateOrder = new Date();
        let state = 'Chờ xác nhận';

        try {
            let data = [purchaseID, req.session.User.id, dateOrder, totalAmount, payment, state];
            let sql = `INSERT INTO purchaseorder (PurchaseOrderID, UserID, OrderDate, Total, PaymentMethod, State) VALUES (?, ?, ?, ?, ?, ?)`;
            db.query(sql, data);
        } catch (err) {
            console.error(err);
            throw err;
        }

        try {
            orderedItems.forEach((item) => {
                let data = [purchaseID, item.ProductID, item.QuantityProduct, item.Price, item.TotalPrice];

                let sql = `INSERT INTO purchaseorderdetail (PurchaseOrderID, ProductID, OrderedQuantity, Price, TotalPrice) VALUES (?, ?, ?, ?, ?)`;

                db.query(sql, data, (err, result) => {
                    if (err) throw err;

                    let updateData = [item.QuantityProduct, item.ProductID];
                    let sqlUpdate = `UPDATE product SET Quantity = Quantity - ? WHERE ProductID = ?`;

                    db.query(sqlUpdate, updateData, (updateErr, updateResult) => {
                        if (updateErr) throw updateErr;
                    });
                });
            });
        } catch (err) {
            console.error(err);
            throw err;
        }

        try {
            if (Array.isArray(listOrderedProductID)) {
                let placeholders = listOrderedProductID.map(() => '?').join(',');
                let sql = `DELETE FROM cartitems WHERE ProductID IN (${placeholders})`;

                await db.query(sql, listOrderedProductID);
            } else {
                let sql = `DELETE FROM cartitems WHERE ProductID = ?`;
                await db.query(sql, listOrderedProductID);
            }
        } catch (err) {
            console.error(err);
            throw err;
        }

        try {
            let totalPrice = cartInfo.TotalPrice - totalAmount;
            let sql = `UPDATE shoppingcart SET TotalPrice = ? WHERE ShoppingCartID = ?`;

            db.query(sql, [totalPrice, cartInfo.ShoppingCartID]);
        } catch (err) {
            console.error(err);
            throw err;
        }
        let user = req.session.User;
        let mess = 'Đặt hàng thành công!';
        res.render('cart/successful', {message: mess, user: user});
    }

    async getPurchaseOrderDetails(req, res, next) {
        let user = req.session.User;
        let purchasrOrderID = req.params.purchasrOrderID;
        let purchaseOrderInfo = await modelCart.getPurchaseOrderInfo(purchasrOrderID);
        let purchaseOrderDetails = purchaseOrderInfo.purchaseOrderDetails;
        res.render('cart/purchase-order-details', {purchaseOrderInfo: purchaseOrderInfo, purchaseOrderDetails: purchaseOrderDetails, user: user});
    }

    async searchPurchaseOrder(req, res, next) {
        if (req.session.User) {
            let listOrders = await modelUser.getAllPurchaseOrders();
            listOrders.forEach((item) => {
                item.OrderDate = item.OrderDate.toLocaleString();
            });
            res.render('cart/search-order', {user: req.session.User, listOrders: listOrders});
        } else {
            req.session.back = '/cart/search-purchase-order';
            res.redirect('/user/sign-in');
        }
    }
}

module.exports = new CartController();

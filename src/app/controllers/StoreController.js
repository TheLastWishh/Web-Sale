const modelStore = require('../model/model_store');
const db = require('../model/database');

class storeController {
    // [GET] /store/:/category
    async listByCat(req, res, next) {
        let name = req.params.category;
        let classify = await modelStore.group(name);
        let listCat = await modelStore.listCat();
        let listSupplier = await modelStore.listSupplier();
        listSupplier.forEach((item) => {
            item.category = name;
        });
        let listProduct = await modelStore.listByName(name);
        res.render('product/products-by-type', {classify: classify, listCat: listCat, listSupplier: listSupplier, listProduct: listProduct});
    }

    async listByCost(req, res, next) {
        let category = req.params.category;
        let rangeMin = req.body.rangeMin;
        let rangeMax = req.body.rangeMax;

        let classify = await modelStore.group(category);
        let listCat = await modelStore.listCat();
        let listSupplier = await modelStore.listSupplier();
        listSupplier.forEach((item) => {
            item.category = category;
        });
        let listProduct = await modelStore.listByCost(category, rangeMin, rangeMax);

        res.render('product/products-by-type', {classify: classify, listCat: listCat, listSupplier: listSupplier, listProduct: listProduct});
    }

    // [GET] /store/:category/:supplier
    async listBySupplier(req, res, next) {
        let {category, supplier} = req.params;
        let classify = await modelStore.group(category);
        let listCat = await modelStore.listCat();
        let listSupplier = await modelStore.listSupplier();
        listSupplier.forEach((item) => {
            item.category = category;
        });
        let listProduct = await modelStore.listBySupplier(category, supplier);
        res.render('product/products-by-type', {classify: classify, listCat: listCat, listSupplier: listSupplier, listProduct: listProduct});
    }

    // [GET] /store/:ProductName/details
    async productDetails(req, res, next) {
        let productName = req.params.ProductName;
        let productDetails = await modelStore.getProductDetails(productName);
        let listComments = await modelStore.getComments(productName);
        listComments.forEach((item) => {
            item.date = item.date.toLocaleString();
        });
        res.render('product/product-details', {productDetails: productDetails, listComments: listComments});
    }

    // [POST] /store/comment/create-comment
    async createComment(req, res, next) {
        let username = req.body.username;
        let email = req.body.email;
        let productID = req.body.productID;
        let comment = req.body.comment;
        let rating = req.body.rating;
        let date = new Date();

        let data = {
            username: username,
            email: email,
            ProductID: productID,
            comment: comment,
            rating: rating,
            date: date,
        };

        try {
            let sql = `INSERT INTO comment set ?`;
            db.query(sql, data);
        } catch (err) {
            console.log(err);
            throw err;
        }

        let productName = req.body.productName;
        res.redirect(`/store/${productName}/details`);
    }
}

module.exports = new storeController();

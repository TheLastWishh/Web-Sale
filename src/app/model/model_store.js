const db = require('./database');

var brand = [];
var category = [];
var productCategoryID = [];
var dataListPro = [];

exports.listBrand = async () => {
    return new Promise((resolve, reject) => {
        let sql = `SELECT * FROM supplier`;
        db.query(sql, (err, result) => {
            console.log('Get list brand success');
            brand = result;
            resolve(brand);
        });
    });
};

exports.listCat = async () => {
    return new Promise((resolve, reject) => {
        let sql = `SELECT * FROM productcategories`;
        db.query(sql, (err, result) => {
            console.log('Get list category success');
            category = result;
            resolve(category);
        });
    });
};

exports.listByName = async (nameCat) => {
    return new Promise((resolve, reject) => {
        let sql1 = `SELECT * FROM productcategories WHERE ProductCategoryName = '${nameCat}'`;
        db.query(sql1, (err, result) => {
            console.log('Get ProductCategoryID success');
            productCategoryID = result[0].ProductCategoryID;
        });

        let sql2 = `SELECT * FROM product WHERE ProductCategoryID = '${productCategoryID}'`;
        db.query(sql2, (err, result) => {
            console.log('Get list product by ProductCategoryID success');
            dataListPro = result;
            resolve(dataListPro);
        });
    });
};

const db = require('./database');

exports.group = async (nameCat) => {
    try {
        let sql1 = `SELECT * FROM productcategories WHERE ProductCategoryName = ?`;
        const categoryResult = await new Promise((resolve, reject) => {
            db.query(sql1, [nameCat], (err, result) => {
                if (err) {
                    return reject(err);
                }
                if (result.length === 0) {
                    return reject(new Error('Không tìm thấy danh mục'));
                }
                resolve(result[0].ProductCategoryID);
            });
        });

        let sql2 = `SELECT 
                        groupproduct.GroupProductName,
                        productcategories.ProductCategoryName
                    FROM 
                        productcategories
                    INNER JOIN 
                        groupproduct ON productcategories.GroupProductID = groupproduct.GroupProductID
                    WHERE 
                        productcategories.ProductCategoryID = ?`;
        const classify = await new Promise((resolve, reject) => {
            db.query(sql2, [categoryResult], (err, result) => {
                if (err) {
                    return reject(err);
                }
                resolve(result[0]);
            });
        });

        return classify;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

exports.listSupplier = async () => {
    try {
        let sql = `SELECT * FROM supplier`;
        const supplier = await new Promise((resolve, reject) => {
            db.query(sql, (err, result) => {
                if (err) {
                    return reject(err);
                }
                console.log('Get list supplier success');
                resolve(result);
            });
        });

        return supplier;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

exports.listCat = async () => {
    try {
        let sql = `SELECT * FROM productcategories ORDER BY GroupProductID ASC`;
        const categoryResult = await new Promise((resolve, reject) => {
            db.query(sql, (err, result) => {
                if (err) {
                    return reject(err);
                }
                console.log('Get list category success');
                resolve(result);
            });
        });

        return categoryResult;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

exports.listByName = async (nameCat) => {
    try {
        // Truy vấn đầu tiên để lấy ProductCategoryID
        let sql1 = `SELECT * FROM productcategories WHERE ProductCategoryName = ?`;
        const categoryResult = await new Promise((resolve, reject) => {
            db.query(sql1, [nameCat], (err, result) => {
                if (err) {
                    return reject(err);
                }
                if (result.length === 0) {
                    return reject(new Error('Không tìm thấy danh mục'));
                }
                console.log('Lấy ProductCategoryID thành công');
                resolve(result[0].ProductCategoryID);
            });
        });

        // Truy vấn thứ hai để lấy sản phẩm theo ProductCategoryID
        let sql2 = `SELECT * FROM product WHERE ProductCategoryID = ? AND Quantity > 0`;
        const productResult = await new Promise((resolve, reject) => {
            db.query(sql2, [categoryResult], (err, result) => {
                if (err) {
                    return reject(err);
                }
                console.log('Lấy danh sách sản phẩm theo ProductCategoryID thành công');
                resolve(result);
            });
        });

        return productResult;
    } catch (error) {
        console.error(error);
        throw error;
    }
};

exports.listBySupplier = async (cat, sup) => {
    try {
        let sql1 = `SELECT * FROM productcategories WHERE ProductCategoryName = ?`;
        const categoryID = await new Promise((resolve, reject) => {
            db.query(sql1, [cat], (err, result) => {
                if (err) {
                    return reject(err);
                }
                if (result.length === 0) {
                    return reject(new Error('Không tìm thấy danh mục'));
                }
                resolve(result[0].ProductCategoryID);
            });
        });

        let sql2 = `SELECT * FROM supplier WHERE SupplierName = ?`;
        const supplierID = await new Promise((resolve, reject) => {
            db.query(sql2, [sup], (err, result) => {
                if (err) {
                    return reject(err);
                }
                if (result.length === 0) {
                    return reject(new Error('Không tìm thấy nhà cung cấp'));
                }
                resolve(result[0].SupplierID);
            });
        });

        let sql3 = `SELECT * FROM product WHERE ProductCategoryID = ? AND SupplierID = ? AND Quantity > 0`;
        const product = await new Promise((resolve, reject) => {
            db.query(sql3, [categoryID, supplierID], (err, result) => {
                if (err) {
                    return reject(err);
                }
                console.log('Lấy danh sách sản phẩm theo danh mục và nhà cung cấp thành công');
                resolve(result);
            });
        });

        return product;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

exports.listByCost = async (category, rangeMin, rangeMax) => {
    try {
        let sql1 = `SELECT * FROM productcategories WHERE ProductCategoryName = ?`;
        const categoryID = await new Promise((resolve, reject) => {
            db.query(sql1, [category], (err, result) => {
                if (err) {
                    return reject(err);
                }
                if (result.length === 0) {
                    return reject(new Error('Không tìm thấy danh mục'));
                }
                resolve(result[0].ProductCategoryID);
            });
        });

        let sql2 = `SELECT * FROM product WHERE price BETWEEN ? AND ?
                    AND productCategoryID = ? AND Quantity > 0`;
        const product = await new Promise((resolve, reject) => {
            db.query(sql2, [rangeMin, rangeMax, categoryID], (err, result) => {
                if (err) {
                    return reject(err);
                }
                resolve(result);
            });
        });

        return product;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

exports.getProductDetails = async (productName) => {
    try {
        let sql1 = `SELECT * FROM product WHERE ProductName =?`;
        const productDetails = await new Promise((resolve, reject) => {
            db.query(sql1, [productName], (err, result) => {
                if (err) {
                    return reject(err);
                }
                if (result.length === 0) {
                    return reject(new Error('Không tìm thấy sản phẩm'));
                }
                console.log('Lấy thông tin sản phẩm thành công');
                resolve(result[0]);
            });
        });

        let sql2 = `SELECT * FROM productcategories WHERE ProductCategoryID =?`;
        const productCategory = await new Promise((resolve, reject) => {
            db.query(sql2, [productDetails.ProductCategoryID], (err, result) => {
                if (err) {
                    return reject(err);
                }
                if (result.length === 0) {
                    return reject(new Error('Không tìm thấy phân loại sản phẩm'));
                }
                console.log('Lấy thông tin loại sản phẩm thành công');
                resolve(result[0]);
            });
        });

        let sql3 = `SELECT * FROM groupproduct WHERE GroupProductID =?`;
        const groupProduct = await new Promise((resolve, reject) => {
            db.query(sql3, [productCategory.GroupProductID], (err, result) => {
                if (err) {
                    return reject(err);
                }
                if (result.length === 0) {
                    return reject(new Error('Không tìm thấy nhóm sản phẩm'));
                }
                console.log('Lấy thông tin nhóm sản phẩm thành công');
                resolve(result[0]);
            });
        });

        productDetails.ProductCategoryName = productCategory.ProductCategoryName;
        productDetails.GroupProductName = groupProduct.GroupProductName;

        return productDetails;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

exports.getComments = async (productName) => {
    try {
        let sql1 = `SELECT * FROM product WHERE ProductName =?`;
        const productID = await new Promise((resolve, reject) => {
            db.query(sql1, [productName], (err, result) => {
                if (err) {
                    return reject(err);
                }
                resolve(result[0].ProductID);
            });
        });

        let sql2 = `SELECT * FROM comment WHERE ProductID =?`;
        const comments = await new Promise((resolve, reject) => {
            db.query(sql2, [productID], (err, result) => {
                if (err) {
                    return reject(err);
                }
                resolve(result);
            });
        });

        return comments;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

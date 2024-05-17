const modelCategory = require('../model/model_store');
const db = require('../model/database');

class storeController {
    async listByCat(req, res, next) {
        let name = req.params.name;
        console.log(name);
        let listBrand = await modelCategory.listBrand();
        let listByCat = await modelCategory.listByName(name);
        res.render('product/products-by-type', {listBrand: listBrand, listByCat: listByCat});
    }
}

module.exports = new storeController();

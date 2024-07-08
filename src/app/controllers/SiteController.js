const modelStore = require('../model/model_store');
class SiteController {
    // [GET] /
    async homePage(req, res) {
        let airConditioner = await modelStore.listByName('Điều hòa nhiệt độ');

        res.render('home', {airConditioner: airConditioner});
    }
}

module.exports = new SiteController();

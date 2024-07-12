const modelStore = require('../model/model_store');
class SiteController {
    // [GET] /
    async homePage(req, res) {
        let airConditioner = await modelStore.listByName('Điều hòa nhiệt độ');
        let television = await modelStore.listByName('Ti vi');
        let fridge = await modelStore.listByName('Tủ lạnh');
        let user = req.session.User;

        res.render('home', {airConditioner: airConditioner, television: television, fridge: fridge, user: user});
    }
}

module.exports = new SiteController();

class SiteController {
    // [GET] /
    homePage(req, res) {
        res.render('home')
    }
}

module.exports = new SiteController()

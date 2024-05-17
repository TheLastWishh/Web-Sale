const express = require('express');
const router = express.Router();
const storeController = require('../app/controllers/StoreController');

router.get('/:name', storeController.listByCat);

module.exports = router;

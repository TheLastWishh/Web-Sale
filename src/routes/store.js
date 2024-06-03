const express = require('express');
const router = express.Router();
const storeController = require('../app/controllers/StoreController');

router.post('/comment/create-comment', storeController.createComment);
router.get('/:ProductName/details', storeController.productDetails);
router.post('/:category/filter-by-cost', storeController.listByCost);
router.get('/:category/:supplier', storeController.listBySupplier);
router.get('/:category', storeController.listByCat);

module.exports = router;

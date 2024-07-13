const express = require('express');
const router = express.Router();
const cartController = require('../app/controllers/CartController');

router.get('/search-purchase-order', cartController.searchPurchaseOrder);
router.get('/:productName/add-1', cartController.addOne);
router.post('/:productName/add-more', cartController.addMore);
router.get('/:productID/delete', cartController.delete);
router.post('/checkout', cartController.checkOut);
router.post('/order', cartController.order);
router.get('/purchase-order-details/:purchasrOrderID', cartController.getPurchaseOrderDetails);
router.get('/', cartController.showCart);

module.exports = router;

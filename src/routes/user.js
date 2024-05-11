const express = require('express');
const router = express.Router();
const userController = require('../app/controllers/UserController');
const {route} = require('./site');

router.get('/my-account', userController.getMyAccount);
router.get('/sign-in', userController.signIn);
router.post('/handle-sign-in', userController.handleSignIn);
router.get('/sign-up', userController.signUp);
router.post('/store', userController.store);
router.get('/sign-up-successfully', userController.signUpSuccess);
router.get('/forget-password', userController.forgetPassword);
router.post('/recover-password', userController.recoverPassword);
router.post('/change-password', userController.changePassword);
router.post('/update', userController.update);
router.get('/sign-out', userController.signOut);

module.exports = router;

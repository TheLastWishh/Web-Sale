const express = require('express')
const router = express.Router()
const userController = require('../app/controllers/UserController')

router.get('/sign-in', userController.signIn)
router.post('/handle-sign-in', userController.handleSignIn)
router.get('/sign-up', userController.signUp)
router.post('/store', userController.store)
router.get('/sign-up-successfully', userController.signUpSuccess)

module.exports = router

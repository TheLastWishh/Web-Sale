const bcrypt = require('bcrypt');
const modelUser = require('../model/model_user');
const db = require('../model/database');

class UserController {
    // [GET] /user/sign-in
    signIn(req, res, next) {
        res.render('users/signin');
    }

    // [POST] /user/sign-in
    handleSignIn(req, res, next) {
        let username = req.body.username;
        let password = req.body.password;

        if (username && password) {
            let sql = `SELECT * FROM user WHERE username = '${username}' OR email = '${username}'`;
            db.query(sql, (err, rows) => {
                if (rows.length <= 0) {
                    res.redirect('/user/dang-nhap');
                    console.log('Tài khoản không tồn tại');
                    return;
                }

                let user = rows[0];
                let pass_fromdb = user.Password;
                var result = bcrypt.compareSync(password, pass_fromdb);

                if (result) {
                    req.session.User = {
                        id: user.UserID,
                        username: user.UserName,
                        phone: user.PhoneNumber,
                        email: user.Email,
                        address: user.Address,
                        logIn: true,
                    };

                    if (req.session.back) {
                        console.log(req.session.back);
                        res.redirect(req.session.back);
                    } else {
                        res.redirect('/');
                    }
                } else {
                    res.redirect('/user/sign-in');
                }
            });
        }
    }

    // [GET] /user/sign-up
    signUp(req, res, next) {
        res.render('users/signup');
    }

    // [POST] /user/store
    async store(req, res, next) {
        const {username, email, phone, password, retypePassword, address} =
            req.body;
        let checkUsername = await modelUser.checkUsername(username);

        if (!checkUsername) {
            if (password === retypePassword && password != '') {
                var salt = bcrypt.genSaltSync(10);
                var pass = bcrypt.hashSync(password, salt);
                let userid = await modelUser.generateID();

                let user_info = {
                    userid: userid,
                    username: username,
                    email: email,
                    phoneNumber: phone,
                    password: pass,
                    address: address,
                    role: 0,
                };

                let sql = 'INSERT INTO user SET ?';
                db.query(sql, user_info);
                res.redirect('/user/sign-up-successfully');
            } else {
                res.redirect('/user/sign-up');
            }
        } else {
            res.send(
                `<script>alert('Tên đăng nhập đã tồn tại!'); window.location='/user/sign-up';</script>`
            );
        }
    }

    signUpSuccess(req, res, next) {
        res.render('users/signup-successfully');
    }
}

module.exports = new UserController();

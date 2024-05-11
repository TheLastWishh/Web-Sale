const bcrypt = require('bcrypt');
const modelUser = require('../model/model_user');
const db = require('../model/database');

class UserController {
    // [GET] /user/my-account
    getMyAccount(req, res, next) {
        if (req.session.User) {
            res.render('users/my-account', {user: req.session.User});
        } else {
            req.session.back = '/user/my-account';
            res.redirect('/user/sign-in');
        }
    }

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
                    res.redirect('/user/sign-in');
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
                var salt = bcrypt.genSaltSync(10); // Tạo chuỗi salt thêm vào mật khẩu
                var pass = bcrypt.hashSync(password, salt); // Mã hóa mật khẩu
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
            let mess = 'Tên đăng nhập đã tồn tại!';
            res.render('users/signup', {message: mess});
        }
    }

    // [GET] /user/sign-up-successfully
    signUpSuccess(req, res, next) {
        let mess = 'Đăng ký thành công!';
        res.render('users/successful', {message: mess});
    }

    // [GET] /user/forget-password
    forgetPassword(req, res, next) {
        res.render('users/forget-password');
    }

    // [POST] /user/recover-password
    async recoverPassword(req, res, next) {
        let email = req.body.email;
        let checkEmail = await modelUser.checkEmail(email);

        if (email == '') {
            let mess = 'Mời bạn nhập email';
            res.render('users/forget-password', {message: mess});
        }

        if (checkEmail) {
            let mess = `Mật khẩu đã được gửi qua email ${email} của bạn!`;
            let newPassword = Math.random().toString(36).substring(7);

            var salt = bcrypt.genSaltSync(10);
            var newPass = bcrypt.hashSync(newPassword, salt);
            let sql = `UPDATE user SET Password = '${newPass}' WHERE Email = '${email}'`;
            db.query(sql);

            const nodemailer = require('nodemailer');

            const transporter = nodemailer.createTransport({
                service: 'gmail',
                host: 'smtp.gmail.com',
                port: 465,
                secure: true,
                auth: {
                    user: 'electrohub383@gmail.com',
                    pass: 'fxahsjbbjxcuocuw',
                },
            });

            const mailOptions = {
                from: '"Electro Hub" <electrohub383@gmail.com>',
                to: `${email}`,
                subject: 'Lấy lại mật khẩu',
                html: `Siêu thị điện máy ElectroHub xin gửi lại mật khẩu của bạn. <br/>
                        Mật khẩu mới của bạn: <b style="padding: 5px 7px; background: #eee; color: red"> ${newPassword} </b>`,
            };

            transporter.sendMail(mailOptions, function (error, info) {
                if (error) console.log(error);
                else console.log('Email sent:' + info.response);
                res.render('users/successful', {message: mess});
            });
        } else {
            let mess = 'Email không tồn tại!';
            res.render('users/forget-password', {message: mess});
        }
    }

    // [GET] /user/change-password
    changePassword(req, res, next) {
        let password = req.body.password;
        let newPassword = req.body.newPassword;
        let confirmPassword = req.body.confirmPassword;
        let username = req.session.User.username;

        let sql1 = `SELECT * FROM user WHERE username = '${username}'`;
        db.query(sql1, (err, rows) => {
            if (rows.length <= 0) {
                res.redirect('/user/error');
                return;
            }

            let user = rows[0];
            let pass_fromdb = user.Password;
            var kq = bcrypt.compareSync(password, pass_fromdb);
            if (kq) {
                if (newPassword === confirmPassword) {
                    var salt = bcrypt.genSaltSync(10);
                    var newPass = bcrypt.hashSync(newPassword, salt);
                    let sql2 = `UPDATE user SET Password = '${newPass}' WHERE UserName = '${username}'`;

                    db.query(sql2, (err, result) => {
                        let mess = 'Đổi mật khẩu thành công';
                        res.render('users/successful', {message: mess});
                    });
                }
            }
        });
    }

    // [POST] /user/update
    update(req, res, next) {
        let username = req.body.username;
        let email = req.body.email;
        let phone = req.body.phone;
        let address = req.body.address;
        let userID = req.session.User.id;
        if (username || email || phone || address) {
            if (username) {
                let sql = `UPDATE user SET UserName = '${username}' WHERE UserID = '${userID}'`;
                db.query(sql);
            }

            if (email) {
                let sql = `UPDATE user SET Email = '${email}' WHERE UserID = '${userID}'`;
                db.query(sql);
            }

            if (phone) {
                let sql = `UPDATE user SET PhoneNumber = '${phone}' WHERE UserID = '${userID}'`;
                db.query(sql);
            }

            if (address) {
                let sql = `UPDATE user SET Address = '${address}' WHERE UserID = '${userID}'`;
                db.query(sql);
            }

            req.session.destroy();
            let mess = 'Cập nhật thông tin người dùng thành công!';
            res.render('users/successful', {message: mess});
        } else {
            return;
        }
    }

    // [GET] /user/sign-out
    signOut(req, res, next) {
        req.session.destroy();
        res.redirect('/user/sign-in');
    }
}

module.exports = new UserController();

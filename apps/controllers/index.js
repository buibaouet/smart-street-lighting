var express = require("express");
var router = express.Router();
var db = require("../models/user.js");
var db1 = require("../models/statistic.js");
var db2 = require("../models/statistic.js");

router.use("/introduce", require(__dirname + "/introduce.js"));
router.use("/admin", require(__dirname + "/admin.js"));

router.get("/", function(req, res){
	if(req.session.user){
		var data = db1.getdata_e();
		data.then(function(data){			
			res.render("index.ejs", {data: data, session: req.session.user});
		});
	}else{
		res.redirect("/login");
	}
});

router.get("/login", function(req, res){
	res.render("signin", {data:{}});
});

router.post("/login",function(req, res){
	var params = req.body;

	var check = db.check_account(params.email);

	if(check){
		check.then(function(data){
			var acc = data[0];
			if(!acc){
				res.render("signin", {data:{error: "Tài khoản không tồn tại"}});
			}
			else if(acc.password == params.password){
				req.session.user = acc;
				console.log(req.session.user);
				res.redirect("/");
			}
			else{
				res.render("signin", {data:{error: "Tài khoản hoặc mật khẩu không chính xác"}});
			}
		});
	}
	else{
		res.render("signin", {data:{error: "Tài khoản không tồn tại"}});
	}
})

router.get("/register", function(req, res){
	res.render("signup.ejs", {data: {}});
});

router.post("/register", function (req, res){
	var params = req.body;

	if (params.password != params.re_password) {
		res.render("signup.ejs", {data: {error: "Mật khẩu không trùng khớp!"}});
	}
	else{
		user = {
			email : params.email,
			name : params.name,
			password : params.password,
			admin : 0
		};

		var check = db.check_account(params.email);

		if(check){
			check.then(function(data){
				var acc = data[0];
				if(!acc){
					var result = db.add_user(user);

					if(result){
						res.redirect("/login");
					}
					else{
						res.render("signup", {data: {error :"Đăng ký không thành công"}});
					}
				}
				else{
					res.render("signup", {data: {error :"Tài khoản đã tồn tại"}});
				}
			});
		}
		else{
			res.render("signin", {data:{error: "Tài khoản đã tồn tại"}});
		}
	}
});

router.get("/logout", function(req, res){
	if(req.session.user){
		req.session.user = null;
		res.redirect("/login");
	}else{
		res.redirect("/login");
	}
});

router.get("/statistic", function(req, res){
	if(req.session.user){
		var data = db2.getdata_l();
		data.then(function(data){			
			res.render("statistic.ejs", {data: data, session: req.session.user});
		});
	}else{
		res.redirect("/login");
	}
});

module.exports = router;
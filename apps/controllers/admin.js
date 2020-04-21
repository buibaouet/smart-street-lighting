var express = require("express");
var router = express.Router();
var db = require("../models/manager.js");
var db1 = require("../models/user.js");

router.get("/control", function(req, res){
	if(req.session.user){
		var data = db.getdata();
		data.then(function(data){			
			res.render("control.ejs", {data: data, session: req.session.user});
		});
	}else{
		res.redirect("/login");
	}
});

router.get("/manager", function(req, res){
	if(req.session.user){
		res.render("manager.ejs", {session: req.session.user});
	}else{
		res.redirect("/login");
	}
});

router.get("/users", function(req, res){
	if(req.session.user){
		var data = db1.getuser();
		data.then(function(user){			
			res.render("user_list.ejs", {data: user, session: req.session.user});
		});
	}else{
		res.redirect("/login");
	}
});

module.exports = router;
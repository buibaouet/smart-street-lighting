var express = require("express");
var router = express.Router();

router.get("/", function(req, res){
	if(req.session.user){
		res.render("intro.ejs", {session: req.session.user});
	}else{
		res.redirect("/login");
	}
});

module.exports = router;
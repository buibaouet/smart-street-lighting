var database = require("../models/database.js");
var q = require("q");
var conn = database.getConnection();

function add_user(user){
	if(user){
		var defer = q.defer();

		var query = conn.query("INSERT INTO user SET ?", user, function(err, result){
			if(err){
				defer.reject(err);
			}
			else{
				defer.resolve(result);
			}
		});
		return defer.promise;
	}
	return false;
}

function check_account(email){
	if(email){
		var defer = q.defer();

		var query = conn.query("SELECT * FROM user WHERE ?", {email : email}, function(err, result){
			if(err){
				defer.reject(err);
			}
			else{
				defer.resolve(result);
			}
		});
		return defer.promise;
	}
	return false;
}

function getuser(){
	var defer = q.defer();

		var query = conn.query("SELECT * FROM user", function(err, result){
			if(err){
				defer.reject(err);
			}
			else{
				defer.resolve(result);
			}
		});
		return defer.promise;
}

module.exports = {
	add_user : add_user,
	check_account : check_account,
	getuser : getuser
}
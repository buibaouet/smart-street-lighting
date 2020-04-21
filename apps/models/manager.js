var database = require("../models/database.js");
var q = require("q");
var conn = database.getConnection();

function getdata(){
	var defer = q.defer();

	var query = conn.query("SELECT li.*, gr.name AS gr_name FROM light_inf li JOIN group_lights gr ON li.group_id = gr.id", function(err, result){
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
	getdata : getdata
}
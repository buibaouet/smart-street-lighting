var database = require("../models/database.js");
var q = require("q");
var conn = database.getConnection();

function getdata_e(){
	var defer = q.defer();

	var query = conn.query("SELECT e.*, l.name, gr.name AS gr_name FROM e_report e JOIN light_inf l ON e.id = l.id JOIN group_lights gr ON l.group_id = gr.id ORDER BY e.day DESC", function(err, result){
		if(err){
			defer.reject(err);
		}
		else{
			defer.resolve(result);
		}
	});
	return defer.promise;
}
function getdata_l() {
	var defer = q.defer();

	var query = conn.query("SELECT lr.*, l.name, gr.name AS gr_name, l.location as location FROM l_report lr JOIN light_inf l ON lr.id = l.id JOIN group_lights gr ON l.group_id = gr.id ORDER BY lr.time DESC", function(err, result){
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
	getdata_e : getdata_e,
	getdata_l : getdata_l
}
var config = require("config");
var mysql = require("mysql");

var conn = mysql.createConnection({
	host : config.get("mysql.host"),
	port : config.get("mysql.port"),
	database : config.get('mysql.database'),
	user : config.get("mysql.user"),
	password : config.get("mysql.password")
})

conn.connect();

function getConnection(){
	if(!conn){
		conn.connect();
	}
	return conn;
}

module.exports = {
	getConnection : getConnection
}
var express = require("express");
var config = require("config");
var bodyParser = require("body-parser");
var session = require('express-session');

var app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.set('trust proxy', 1) // trust first proxy
app.use(session({
  secret: 'secretkey',
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false }
}));

app.set("views", __dirname + "/apps/views");
app.set("view engine", "ejs");
app.use("/static", express.static(__dirname + "/public"));

var controllers = require(__dirname + "/apps/controllers/index.js");
app.use(controllers);

var port = config.get("server.port");

app.listen(port, function(){
	console.log("Server is running on port:",port);
});
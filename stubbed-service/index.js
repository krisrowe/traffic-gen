var express = require('express');
var app = express();
var path = require('path');

app.get('/', function(req, res){
   res.send("Hello world!");
});

app.get('/products', function(req, res) {
    res.sendFile(path.join(__dirname, 'products.json'));
});

app.listen(process.env.PORT || 3000);

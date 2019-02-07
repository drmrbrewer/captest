#!/bin/env node

const express = require('express');
const app = express();

// https://dev.cloud3squared.com/test
app.get('/test', function(req, res, next) {
    res.status(200).send('well this really does not do much does it?');
});

app.listen(process.env.PORT || 8080, process.env.IP, function() {
    console.log('node server started at', new Date());
});

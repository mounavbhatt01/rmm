const express = require('express');
var path = require('path');
const fs = require("fs");
const csvParser = require("csv-parser");
const tableify = require("tableify");
const bodyParser = require("body-parser");


const app = express();
app.use(bodyParser.json())

const port = 3000;

let result = [];
let table;
let zipCode;

app.use(express.static(path.join(__dirname, 'public')));

app.get('/', (req, res) => {
  res.send('Hello World!');
});


app.post('/api', (req, res) => {
  console.log('Got a POST request');
  // console.log(req);
  console.log(req.body);
  console.log(req.params);
  console.log(req.query);
  

  result = [];
  
  zipCode = req.body["zipcode"];


  fs.createReadStream("./datasheet.tsv")
    .pipe(csvParser({
      separator: '\t',
      mapHeaders: ({ header, index }) => header.trim(),
      mapValues: ({ header, index, value }) => value.trim()
    }))
    .on("data", (data) => {
      result.push(data);
    })
    .on("end", () => {
      // console.log(result);
      var search = [];
      const best = result.filter((technicianProfile) => { return technicianProfile["PIN code"] == zipCode });
      for (var i = 6; i >= 1; i--) {
        var zipPart = zipCode.substring(0, i);
        search = search.concat(result.filter((technicianProfile) => { return technicianProfile["PIN code"].startsWith(zipPart) }));
      }
      for(var item in search)
      {
        console.log(item);
        search[item]["Shop image"] = `<img src="${search[item]["Shop image"]}">`;
        search[item]["Passport pic"] = `<img src="${search[item]["Passport pic"]}">`;
      }
      console.log(search);
      table = tableify(search);
      res.send(table);
    });
});

app.listen(port, () => {
  console.log(`App listening on port http://localhost:${port}`);
});

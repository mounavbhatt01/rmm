const fs = require("fs");
const csvParser = require("csv-parser");


let result = [];

const zipCode = "832403";

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
    const best = result.filter((technicianProfile)=>{return technicianProfile["PIN code"] == zipCode});
    for (var i = 6; i>=1;i--)
    {
        var zipPart = zipCode.substring(0,i);
        search = search.concat(result.filter((technicianProfile)=>{return technicianProfile["PIN code"].startsWith(zipPart)}));
    }
    search = new Set(search);
    console.log(best);
    console.log("After best",search);

  });
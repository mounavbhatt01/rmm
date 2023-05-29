const mysql=require('mysql')
const xlsx=require('xlsx')

const db=mysql.createConnection({
    host:"localhost",
    user:"root",
    password:'',
    database:"rmm_database"
})

let workbook=xlsx.readFile('database script\Students shop detail.xlsx')
let worksheet=workbook.Sheets[workbook.SheetNames[0]]
let range=xlsx.utils.decode_range(worksheet["!ref"])

for(let row=range.s.c;col<=range.e.c;col++){
    let data=[]

    for(let col=range.s.c;col<=range.e.c;col++){
        let cell=worksheet[xlsx.utils.encode_cell({r:row,c:col})]
        data.push(cell.v)
    }
    console.log(data)

    let sql="INSERT INTO 'customers table' ('Name','Address','State','Pincode','Issue','Model Name') VALUES(?,?,?,?,?,?)"
    db.query(sql,data,(err,results,fields)=>{
        if(err){
            return console.error(err.message)
        }
        console.log('Customer Id'+results.insertId)
    })
}

db.end()
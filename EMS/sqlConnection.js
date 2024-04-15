//For making connections
const mysql = require('mysql');
const dotenv = require('dotenv');
dotenv.config();

const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'samp'
});

con.connect((err) => {
    if (err) {
        console.error('Error connecting to database:', err.message);
        process.exit(1); // Exit the application with a non-zero exit code
    }
    console.log("Database Connected");
});


// con.connect((err)=>{
//     if(err) throw err;
//     console.log("Database Connected");
// });

module.exports.con = con;
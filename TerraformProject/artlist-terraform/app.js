const mysql = require('mysql');
const connection = mysql.createConnection({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASS,
  database: process.env.MYSQL_DB,
  insecureAuth: true
});

connection.connect((err) => {
  if (err) throw err;
  console.log('Connected to MySQL Server!!!! Very Very GOOD');
});
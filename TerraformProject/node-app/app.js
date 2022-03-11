const mysql = require('mysql');
const connection = mysql.createConnection({
  socketPath: '/var/run/mysqld/mysqld.sock',
  user: 'root',
  password: 'RotemPass',
  database: 'test_mysql'
});

connection.connect((err) => {
  if (err) throw err;
  console.log('Connected to MySQL Server!');
});
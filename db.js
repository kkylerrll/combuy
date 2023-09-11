var mysql = require('mysql');

// module 被省略掉了
// 如果物件沒有 exec 屬性，就會立刻馬上被執行
// 當前新增的值是箭頭函式
exports.exec = (sql, data, callback) => {
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: 'root',
        database: 'combuy',
        // 是否可以允許使用者一口氣傳入很多sql指令
        multipleStatements: true,
    });
    connection.connect();

    connection.query(sql, data, function (error, results, fields) {
        if (error) {
            console.log(error);
            callback(error, null);
        };
        callback(null, results, fields);
    })
    connection.end();
};




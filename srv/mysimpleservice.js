const mysrvdemo = function(srv){
    srv.on('myFunction', (req,res) => {
        return "hello " +  req.data.msg;           
    });
}

module.exports = mysrvdemo;
const cds = require("@sap/cds");
const { resolve } = require("path");
const { employees } = cds.entities("anubhav.db.master"); 


const mysrvdemo = function(srv){
    srv.on('myFunction', (req,res) => {
        return "hello " +  req.data.msg;           
    });
    //Read
    srv.on("READ", "ReadEmployeeSrv", async(req,res) => {

        var results = [];
        //Sample Data
        // results.push({
        //     "ID" : "02BD2137-0890-1EEA-A6C2-BB55C19787FB",
        //     "nameFirst" : "Ajay",
        //     "nameLast": "Thevendra"
        // });

        //CDS Query Language - Read All
        //results = await cds.tx(req).run(SELECT.from(employees));

        //Read single record
        //results = await cds.tx(req).run(SELECT.from(employees).where({"nameFirst": "Susan"}));

        var whereConditionn= req.data;
        console.log(whereConditionn);
        if((whereConditionn.hasOwnProperty("ID"))){
            results = await cds.tx(req).run(SELECT.from(employees).where(whereConditionn));
        }else{
            results = await cds.tx(req).run(SELECT.from(employees).limit(1));
        }

        return results;
    });
    //Create
    srv.on("CREATE", "InsertEmployeeSrv", async(req,res) => {
        
        let returnData = await cds.transaction(req).run([

            INSERT.into(employees).entries([req.data])

        ]).then( (resolve, reject) => {

            if(typeof(resolve) != undefined)  {
                return req.data;
                
            }else{
                req.error(500, "Issue in insert");
            }
        }).catch( err => {
            req.error(500, "there was error" + err.toString());
        });
        return returnData;
    } );

    //Update
    srv.on("UPDATE", "UpdateEmployeeSrv", async (req, res) => {
        try {
            let returnData = await cds.transaction(req) .run([
                UPDATE(employees)
                    .set({ nameFirst: req.data.nameFirst })
                    .where({ ID: req.data.ID }),
                UPDATE(employees)
                    .set({ nameLast: req.data.nameLast })
                    .where({ ID: req.data.ID })
            ]);
            if (typeof returnData !== 'undefined') {
                return req.data;
            } else {
                req.error(500, "There was an issue in update");
            }
        } catch (err) {
            req.error(500, "There was an error: " + err.toString());
        }
        return returnData;
    });   

    //Delete
    srv.on("DELETE", "UpdateEmployeesrv", async (req, res) => {
        try {
            let returnData = await cds.transaction(req).run([
                DELETE.from("employees").where(req.data)
            ]);
            if (typeof returnData !== 'undefined') {
                return req.data;
            } else {
                req.error(500, "There was an issue in delete");
            }
        } catch (err) {
            req.error(500, "There was an error: " + err.toString());
        }
        return returnData;
    });
}


module.exports = mysrvdemo;
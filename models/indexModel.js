// Importing the database from PG-Promise
const db = require("./conn");

class restauList {
    constructor(name){
        this.name = name;
        
    }
    //Static Async Method 
    static async getAll(){
        try{
            const response = await db.any(`SELECT id,name FROM restaurants;`);
            // console.log(response);
            return response;
        } catch (error){
            return error.message;
        }
    }

}

module.exports = restauList;
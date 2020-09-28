// Importing the database from PG-Promise
const db = require("./conn");

class detailList {
    constructor(name){
        this.name = name;
        
    }
    static async getbyID(id){
        try{
            const response = await db.any(`SELECT * FROM restaurants WHERE id=$1;`,[id]);
            // console.log(response);
            return response;
        } catch (error){
            return error.message;
        }
    }
    static async getreviewsbyID(id){
        try{
            const response = await db.any(`Select id,title,review,stars,name from revbusiness WHERE id =$1 ;`,[id]);
            // console.log(response);
            return response;
        } catch (error){
            return error.message;
        }
    }
    //Post will go here
    static async submitReview(restauid,reviewTitle,review,stars,name){
        
        try{
            const response = await db.result(`INSERT INTO revBusiness (id,title, review, stars,name)
            VALUES ($1,$2,$3,$4,$5);`,[restauid,reviewTitle,review,stars,name]);
            return response;
        } catch (error){
            return error.message;
        }
    }

}

module.exports = detailList;


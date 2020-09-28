//For every single route file we need these two lines
const express = require("express")
const router = express.Router();
const indexModel = require('../models/indexModel');


//Routing Controller Defined, takes req,res as argument gets the req,res objects from express 
//The slash always references the file that it is in
router.get("/",async (request,response)=>{
       //static method available to the class
       const indexData = await indexModel.getAll();
       console.log(indexData);
       response.render("template",{
           locals: {
               title: "List of Restaurants",
               data: indexData,
               is_logged_in: request.session.is_logged_in
               
           },
           //This is the actual view
           partials:{
               partial:"partial-index"
           }
       })
})

//exporting out of the router
module.exports = router;
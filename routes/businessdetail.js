//Where you pass the parameter
//passing parameters they go in the controller
//For every single route file we need these two lines
const express = require("express")
const router = express.Router();
const detailModel = require('../models/detailModel');

//The slash always references the file that it is in
router.get("/:id?",async (request,response)=>{
    //Obtain ID from query of URL string
    var idis = request.params.id;
    // Pass ID to Model to query DB on ID
    const detailData = await detailModel.getbyID(idis);
    const reviewData = await detailModel.getreviewsbyID(idis);
    console.log("this is the session: ", request.session.is_logged_in)
    response.render("template",{
        locals: {
            title: "Restaurant Details",
            data: detailData,
            revData: reviewData,
            is_logged_in: request.session.is_logged_in
        },
        //This is the actual view
        partials:{
            partial:"partial-detail"
        }
    })
})

router.post("/", async(request,response) => {
    
    var reviewTitle = request.body.revtitle;
    var review = request.body.review;
    var stars = request.body.stars;
    var name = request.body.name;
    var restauid = request.body.restauid;
    await detailModel.submitReview(restauid,reviewTitle,review,stars,name);
    const detailData = await detailModel.getbyID(restauid);
    const reviewData = await detailModel.getreviewsbyID(restauid);
    //console.log(reviewData);
    response.render("template",{
        locals: {
            title: "Restaurant Details",
            data: detailData,
            revData: reviewData,
            is_logged_in: request.session.is_logged_in
        },
        //This is the actual view
        partials:{
            partial:"partial-detail"
        }
    })
    //console.log(reviewTitle,review,stars,name,restauid)
    //response.status(200).send("OK").end();
    //renderPage(response);
})

//exporting out of the router
module.exports = router;
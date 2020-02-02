const express = require("express");
const router = express.Router();
const knex = require("./../../config/db");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const config = require("config")

// @route   POST api/auth
// @desc    Login
// @access  Public
router.post("/",async (req,res)=>{
    const {username,password} = req.body;
    try{
        const user = await knex("users").where({username}).first();
        if(!user){
            return res.status(400).send({msg:"Incorrect Email/Password"});
        }
        const isMatch = await bcrypt.compare(password,user.password);
        if(!isMatch){
            return res.status(400).send({msg:"Incorrect Email/Password"});
        }
        const payload = {
            user : {
                id: user.id
            }
        }
        jwt.sign(
            payload,
            config.get("jwtSecret"),
            {expiresIn:360000},
            (err,token)=>{
                if(err) throw err;
                res.send({token});
            }   
        )
    }
    catch(err){
        console.log(err);
        res.status(500).send({msg:"Server error"});
    }
})

module.exports = router;
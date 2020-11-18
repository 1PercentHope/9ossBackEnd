const express = require("express");
const process = require('../../secrets.js')
const db = require("../../../Database/Controller/admins.js");
const { genSalt } = require('../Auth-Hash/salt.js');
const { genHash } = require('../Auth-Hash/hash.js');
const bcrypt = require('bcrypt');
const Auth = require('../Auth-Hash/authToken.js');
const database = require("../../../Database/Controller/events.js");



const router = express.Router();

router.get("/events", async (req, res) => {
    await database.getAllEvents({})
    .then(data => {
        res.json(data);
    })
    .catch(error=>{
        res.send(error)
    })
   });
   

router.post('/events/add', async (req, res) => {
    let homeTeam = req.body.homeTeam;
    let awayTeam = req.body.awayTeam;
    let place = req.body.place;
    let category = req.body.category;
    let date = req.body.date;
    let description = req.body.description;
    let price = req.body.price;
    console.log(req.body)
    await db.addNewEvent(homeTeam, awayTeam, place, category, date, description, price)
        .then(data => {
            res.json(data)
        })
        .catch(error => {
            res.status(500).json(error)
        })
});

router.post('/seats/add', async (req, res) => {
    let type = req.body.type;
    let number = req.body.Number;
    let availability = req.body.availability;
    console.log(req.body)
    await db.addNewSeat(type, number, place, availability)
        .then(data => {
            console.log(data)
            res.json(data)
        })
        .catch(error => {
            console.log(error);
        })
});

router.delete("/seats/remove", async (req, res) => {
    await db.deleteAllSeats(req.body)
        .then(results => {

            res.json("all seats deleted ");
        })
        .catch(error => {
            console.log(error);
        })
});


router.delete("/events/remove", async (req, res) => {
    await db.deleteAllEvents(req.body)
        .then(results => {

            res.json("all events deleted ");
        })
        .catch(error => {
            res.status(500).json(error)
        })
});

router.put("/events/update", async (req, res) => {
    console.log(req.body)
    await db.updateEventInfo(req.body)
        .then(results => {
            res.json(results)
        })
        .catch(error => {
            console.log(error)
        })
})

// admin sign up

router.post("/register", async (req, res) => {
    // check if user informations exists
    const emailExists = await db.getOneAdmin(req.body.email);
    if (emailExists.length > 0) return res.json({ message: "Admin already exists" });
    try {
        //hash password
        const salt = await genSalt();
        const hashedPassword = await genHash(salt, req.body.password);
        // add the new User
        req.body.password = hashedPassword;
        const registredUser = await db.addAdmin(req.body);
        res.json(registredUser.message = "New Admin Were Added");
    } catch (error) {
        console.log(error)
    }
});

// admin log in

router.post('/signin', async (req, res) => {
    console.log(req.body)
    try {
        const admin = await db.getOneAdmin(req.body.email);
        if (admin.length === 0) return res.json({});
        //check password
        const validPass = await bcrypt.compare(req.body.password, admin[0].password)
        if (validPass === false) {
            return res.json({});
        } else {
            const Token = process.ACCESS_TOKEN_SECRET;
            const accessToken = Auth.accessToken(req.body.email, Token);
            const refToken = process.REFRESH_TOKEN_SECRET;
            const refreshToken = Auth.refreshToken(req.body.email, refToken)
            const UserToken = db.addRefreshToken(refreshToken, req.body.email);
            // getting the history of the user from  database and send it to user profile
            res.json({ accessToken, refreshToken })
        }
    } catch (error) {
        console.log(error)
    }
})

// remove an admin

router.delete('/remove',async (req,res)=>{
   const removed = await db.deleteAdmin(req.body.email);
   console.log(removed)
   res.status(200).json('Admin account is deleted!')
})

///////////////////////////////////////// Refresh Token Post /////////////////////////////////////////

router.post('/token', async (req, res) => {
    const refreshTokens = req.body.token
    if (refreshTokens == null) return res.send(401)
    const tokenCheck = await db.getRefreshToken(refreshTokens)
    if (!tokenCheck.includes(refreshToken)) return res.sendStatus(403)
    jwt.verify(refreshTokens, process.REFRESH_TOKEN_SECRET, (err, user) => {
        if (err) return res.sendStatus(403);
        const accesToken = Auth.accessToken(user.email, process.ACCESS_TOKEN_SECRET)
        res.json({ accesToken })
    })
})

///////////////////////////////////////// Refresh Token End /////////////////////////////////////////

///////////////////////////////////////// Log Out And Delete Token  ////////////////////////////////

router.delete('/signout', (req, res) => {
    db.deleteAdminToken(req.body.token)
    res.sendStatus(204)
})

///////////////////////////////////// Log Out And Delete Token End  ////////////////////////////////

module.exports = router;
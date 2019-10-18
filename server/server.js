require('dotenv').config()
const express = require('express')
const massive = require('massive')
const  {SERVER_PORT, CONNECTION_STRING} = process.env
const PORT = SERVER_PORT || 4311
const app = express()

app.use(express)

app.use( express.static( `${__dirname}/../build` ) );
app.use(express.json())

// top level middleware - express method that runs the passed in function on every request that comes to your server
app.use('/api/users', function(req, res, next) {
    res.send()
})


//request-level middleware - will be run on every request made to this endpoint. Should have a next() to allow next function to run
function isAdmin(req,res,next) {
    if(!req.usAuthenticated()){
        return res.redirect('/login')
    } else if (!req.user.admin) {
        return res.status(403).send({error: 'not an admin'})
    }
    next()
}

app.get('/api/state_secrets', isAdmin, function(req, res, next){
    res.status(200).send(stateSecrets)
})

massive(CONNECTION_STRING).then(db=> {
    app.set('db',db)
    app.listen(PORT, ()=> console.log(`^.^ Welcome to ${PORT}`))
}).catch(error => console.log('error connection to DB', error))
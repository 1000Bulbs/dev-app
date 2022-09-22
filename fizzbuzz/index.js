const express = require('express')
const { fizzBuzz } = require('./middlewares/helpers');
const app = express()
const port = 3000

app.get('/', (req, res) => {
    res.send(fizzBuzz())
})


app.listen(port, () => {
    console.log(`App is running on ${port}`)
})

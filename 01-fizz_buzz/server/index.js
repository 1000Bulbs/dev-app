const express = require("express");
const path = require('path');
const app = express();
const PORT = process.env.PORT || 3001;
const fizzBuzz = [];

function createFizzBuzz() {
    for (i = 1; i <= 100; i++) {
        if (i % 15 === 0) {
            fizzBuzz.push({ num: i, say: 'FizzBuzz' });
        } else if (i % 5 === 0) {
            fizzBuzz.push({ num: i, say: 'Buzz'});
        } else if (i % 3 === 0) {
            fizzBuzz.push({ num: i, say: 'Fizz'});
        } else {
            fizzBuzz.push({ num: i, say: '' });
        }
    }
};

createFizzBuzz();

// Have Node serve the files for our built React app
app.use(express.static(path.resolve(__dirname, '../client/build')));

// Handle GET requests to /fizzBuzz route
app.get("/fizzBuzz", (req, res) => {
    const { filter } = req.query;
    let filteredData = fizzBuzz;

    if (filter) {
        filteredData = fizzBuzz.filter((obj) => obj.say === filter);
    }

    res.json({ fizzBuzz: filteredData });
});

// All other GET requests not handled before will return our React app
app.get('*', (req, res) => {
    res.sendFile(path.resolve(__dirname, '../client/build', 'index.html'));
});

app.listen(PORT, () => {
    console.log(`🌎 => API Server listening on ${PORT}`);
});
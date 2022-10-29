var express = require("express");
var router = express.Router();

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

router.get("/", function(req, res, next) {
    res.json({ fizzBuzz });
});

module.exports = router;
const express = require("express");
const app = express();
const port = 3000;

app.use(express.static("www"));

const fizzBuzz = getFizzBuzz();

app.get('/fizzbuzz', (req, res)=>{
    
    res.send(JSON.stringify({"data":fizzBuzz}));
});

console.log(fizzBuzz);

app.listen(port, () => {
    console.log("FizzBuzz ready at http://localhost:3000");
});

function getFizzBuzz(){
    let returnArray = [];
    for(let i=1; i<=100; i++){
        if(i%3==0 && i%5==0){
            returnArray.push("FizzBuzz");
        }else if(i%3==0){
            returnArray.push("Fizz");
        }else if(i%5==0){
            returnArray.push("Buzz");
        }else{
            returnArray.push(i);
        }
    }
    return returnArray;
}
// Program to print the numbers from 1 to 100. 
// For multiples of three print "Fizz" instead of the number 
// and for the multiples of five print "Buzz".
// For numbers which are multiples of both three and five print "FizzBuzz"

let num = 1;
let counting = document.getElementById("counting");

function initialization() {
    setInterval(fizzbuzz, 100);
}

function fizzbuzz() {
    if (num > 100) clearInterval();
    else if (num % 15 == 0) counting.innerHTML += `FizzBuzz<br>`;
    else if (num % 3 == 0) counting.innerHTML += "Fizz, ";
    else if (num % 5 == 0) counting.innerHTML += "Buzz, ";
    else counting.innerHTML += `${ num }, `;
    num ++;
}



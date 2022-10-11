let answerOutput = document.querySelector('challenge-answer');

function fizzBuzz() {
    // let inputMax = 2 * (10 ** 5);
    let inputMax = 1000;

    for (i = 1; i < inputMax; i++) {
        let result = '';

        if (i % 3 === 0 && i % 5 === 0) {
            result += 'Fizz Buzz';
        } else if (i % 3 === 0) {
            result += 'Fizz';
        } else if (i % 5 === 0) {
            result += 'Buzz';
        } else if (result === "") {
            result += i;
        }

        console.log(result);
        // answerOutput.innerHTML(`<p>${result}</p>`);
        answerOutput.appendChild(result);
    }
}

fizzBuzz();
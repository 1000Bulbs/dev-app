let resultContainer = document.getElementById('challenge-answer-list');

function fizzBuzz() {
    let inputMax = 100;

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

        // console.log(result);
        const answerListItem = document.createElement('li');
        resultContainer.appendChild(answerListItem);
        answerListItem.innerHTML = result;
    }
}

fizzBuzz();
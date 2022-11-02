import React from 'react'
// import './App.css';

const FizzBuzz = () => {
    const [fizzState, setFizzState] = React.useState([])

    const fizzBuzz = () => {
        let fizzArr = []
        for (var i = 1; i < 101; i++) {
            if (i % 15 == 0) {
                fizzArr.push({
                    number: i,
                    fizzBuzz: "fizzBuzz"
                })
            }
            else if (i % 3 == 0) fizzArr.push({
                number: i,
                fizzBuzz: "fizz"
            })
            else if (i % 5 == 0) fizzArr.push({
                number: i,
                fizzBuzz: "buzz"
            })
            else fizzArr.push({
                number: i,
                fizzBuzz: " "
            })
        }

        return fizzArr
    }

    React.useEffect(() => {
        setFizzState(fizzBuzz)
    }, []);

    return (
        <div>
            <h1>Periodic Fizz Table</h1>
        <div className='container'>
            {fizzState?.map((f) => (
                <div className='fizzContainer'>
                    <span className='fizzNumber'>{f?.number}</span>
                    <span className='fizzBuzz'>{f?.fizzBuzz}</span>
                </div>
            ))}
        </div>
        </div>
    )
}

export default FizzBuzz
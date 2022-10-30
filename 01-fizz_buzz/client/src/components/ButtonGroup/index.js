import React  from "react";
import Button from 'react-bootstrap/Button';
import './index.scss';
import Fizz from '../../assets/images/fizz.png';
import Buzz from '../../assets/images/buzz.png';

export default function ButtonGroup({ data, filter, handleClick, loading }) {
    const handleFizz = () => handleClick('Fizz');
    const handleBuzz = () => handleClick('Buzz');
    const handleFizzBuzz = () => handleClick('FizzBuzz');



    const fizzImg = <img alt='Fizz bottle cap' src={Fizz} />;
    const buzzImg = <img alt='Cute little bee' src={Buzz} />;

    return(
        <div className='button-group'>
            <Button
                variant="info"
                size="lg"
                disabled={loading || filter === 'Fizz'}
                onClick={handleFizz}
            >
                Show Fizz
                {fizzImg}
            </Button>
            <Button
                variant="primary"
                size="lg"
                disabled={loading || filter === 'Buzz'}
                onClick={handleBuzz}
            >
                Show Buzz
                {buzzImg}
            </Button>
            <Button
                variant="dark"
                size="lg"
                disabled={loading || filter === 'FizzBuzz'}
                onClick={handleFizzBuzz}
            >
                Show FizzBuzz
                {fizzImg}{buzzImg}
            </Button>
        </div>
    )
}
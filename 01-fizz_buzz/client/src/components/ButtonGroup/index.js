import React  from "react";
import Button from 'react-bootstrap/Button';
import './index.scss';
import Fizz from '../../assets/images/fizz.png';
import Buzz from '../../assets/images/buzz.png';

/**
 * The group of buttons at the top of the page that control state on each click
 *
 * @method ButtonGroup
 * @param {Array|null} data
 * @param {String|null} filter
 * @param {Boolean} loading
 * @param {Function} onFetchDataSpeed
 * @param {Function} onFilterApplied
 * @param {Function} onSetThrowError
 * @returns JSX
 */
export default function ButtonGroup({ data, filter, loading, onFetchDataSpeed, onFilterApplied, onSetThrowError }) {
    const handleFizz = () => onFilterApplied('Fizz');
    const handleBuzz = () => onFilterApplied('Buzz');
    const handleFizzBuzz = () => onFilterApplied('FizzBuzz');
    const handleClearFilter = () => onFilterApplied(null);
    const handleSetThrowError = () => onSetThrowError();
    const handleFetchSlowData = () => onFetchDataSpeed();

    const fizzImg = <img alt='Fizz bottle cap' src={Fizz} />;
    const buzzImg = <img alt='Cute little bee' src={Buzz} />;

    return(
        <>
        <div className='button-group'>
            <Button
                variant="warning"
                size="lg"
                disabled={loading}
                onClick={handleFetchSlowData}
            >
                Fetch data slowly
            </Button>
            <Button
                variant="danger"
                size="lg"
                disabled={loading}
                onClick={handleSetThrowError}
            >
                Throw API error
            </Button>
            <Button
                variant="secondary"
                size="lg"
                disabled={loading || !filter}
                onClick={handleClearFilter}
            >
                Clear Filter
            </Button>
        </div>
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
        </>
    )
}
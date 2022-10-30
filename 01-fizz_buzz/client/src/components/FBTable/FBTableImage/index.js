import './index.scss';
import Fizz from '../../../assets/images/fizz.png';
import Buzz from '../../../assets/images/buzz.png';

/**
 * Renders a table cell with an image based on the what it has to 'say'
 *
 * @method TableImages
 * @param {String} say - 'Fizz', 'Buzz', 'FizzBuzz', or ''
 * @returns
 */
function TableImage({ say }) {
    const fizzImg = <img alt='Fizz bottle cap' src={Fizz} />;
    const buzzImg = <img alt='Cute little bee' src={Buzz} />;

    if (say === 'FizzBuzz') {
        return (<td>{fizzImg}{buzzImg}</td>);

    } else if (say === 'Buzz') {
        return (<td>{buzzImg}</td>);

    } else if (say === 'Fizz') {
        return (<td>{fizzImg}</td>);
    }

    return (<td></td>);
}

export default TableImage;
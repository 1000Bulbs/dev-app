import Table from 'react-bootstrap/Table';
import './index.scss';
import FBTableImage from './FBTableImage'

/**
 * Creates the Fizz Buzz table
 *
 * @method FBTable
 * @param {Array|null} data
 * @param {String|null} filter
 * @returns JSX
 */
function FBTable({ data, filter }) {
    return (
        <Table responsive striped bordered hover>
            <caption>Displaying {data.length} of 100 results with {filter ? `the '${filter}' filter` :'no filter'} applied</caption>
            <thead>
                <tr>
                    <th>#</th>
                        <th>Text</th>
                        <th>Image</th>
                    </tr>
            </thead>
            <tbody>
                {data && data.map(({ num, say }) => (
                    <tr key={num}>
                        <td>{num}</td>
                        <td>{say}</td>
                        <FBTableImage say={say} />
                    </tr>
                ))}
            </tbody>
        </Table>
    );
}

export default FBTable;
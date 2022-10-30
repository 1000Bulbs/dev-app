import Table from 'react-bootstrap/Table';
import './index.scss';
import FBTableImage from './FBTableImage'

function FBTable({ data, filteredData}) {
    return (
        <Table responsive striped bordered hover>
            <caption>Displaying {filteredData.length} of {data.length} results</caption>
            <thead>
                <tr>
                    <th>#</th>
                        <th>Text</th>
                        <th>Image</th>
                    </tr>
            </thead>
            <tbody>
                {filteredData && filteredData.map(({ num, say }) => (
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
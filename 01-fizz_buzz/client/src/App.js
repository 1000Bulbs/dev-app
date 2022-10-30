import React, { useState, useEffect } from "react";
import './App.scss';
import FBTable from './components/FBTable';
import ButtonGroup from './components/ButtonGroup';
import Spinner from 'react-bootstrap/Spinner';

export default function App() {
  const [data, setData] = useState(null);
  const [filter, setFilter] = useState();
  const [filteredData, setFilteredData] = useState(null)
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch('http://localhost:9000/fizzBuzz')
      .then((response) => {
        if (!response.ok) {
          const errMsg = `This is an HTTP error: The status is ${response.status}: ${response.statusText}`;

          setError(errMsg)
          throw new Error(errMsg);
        }
        return response.json();
      })
      .then(({ fizzBuzz }) => {
        setData(fizzBuzz);
        setFilteredData(fizzBuzz);
        setError(null)
      })
      .catch((err) => {
        setError(err.message);
        setData(null);
      })
      .finally(() => {
        setLoading(false);
      });
  }, []);

  const handleClick = (selectedFilter) => {
    setFilter(selectedFilter);
    setFilteredData(data.filter((obj) => obj.say === selectedFilter));
  }

  return (
    <main className="App">
      <header className="App-header"></header>
      <section>
        { loading &&
          <div className='loading-state'>
            <p>A moment please...</p>
            <Spinner animation="grow" variant="info" />
          </div> }
        { error && (<div className='error-state'><p>There was a problem fetching FizzBuzz data</p><p>{error}</p></div>)}

        <ButtonGroup data={data} filter={filter} loading={loading} handleClick={handleClick}/>

        {data && data.length && <FBTable data={data} filteredData={ filteredData } />}
      </section>
    </main>
  )
}

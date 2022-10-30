import React, { useState, useEffect } from "react";
import './App.scss';
import FBTable from './components/FBTable';
import ButtonGroup from './components/ButtonGroup';
import Spinner from 'react-bootstrap/Spinner';
import SadPanda from './assets/images/sad-panda.png';

/**
 * @method App
 * @returns JSX
 */
export default function App() {
  // essentially getters and setters for state props with initial values
  const [data, setData] = useState(null);
  const [fetchDataSpeed, setFetchDataSpeed] = useState(0);
  const [filter, setFilter] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [shouldThrowError, setShouldThrowError] = useState(false);

  /**
   * Unlike componentDidMount and componentDidUpdate,
   * the function passed to useEffect fires after layout and paint,
   * during a deferred event. This makes it suitable for the many common side effects,
   * like setting up subscriptions and event handlers,
   * because most types of work shouldn’t block the browser from updating the screen.
   *
   * @method useEffect
   */
  useEffect(() => {
    const baseUrl = '/fizzBuzz';
    let url = baseUrl;

    // add query params for filters
    if (filter) {
      url = `${url}?filter=${filter}`
    }

    // use a bad url to trigger the api throwing a 404
    if (shouldThrowError) {
      url = '/some-garbage-url-that-does-not-exist';
    }

    setTimeout(() => {
      fetch(url)
        .then((response) => {
          if (!response.ok) {
            const errMsg = `This is an HTTP error with status ${response.status}: ${response.statusText}`;

            setError(errMsg)
            throw new Error(errMsg);
          }

          return response.json();
        })
        .then(({ fizzBuzz }) => {
          setData(fizzBuzz);
          setError(null);
        })
        .catch((err) => {
          setError(err.message);
          setData(null);
        })
        .finally(() => {
          setLoading(false);
        });
      }, fetchDataSpeed);
  }, [fetchDataSpeed, filter, loading, shouldThrowError]);

  // when effect dependencies change, reset the others back to their original state
  const resetState = () => {
    setData(null);
    setFetchDataSpeed(0);
    setFilter(null);
    setLoading(true);
    setShouldThrowError(false);
  }

  // Set the filter: null, 'Fizz', 'Buzz', or 'FizzBuzz'
  const handleSetFilter = (selectedFilter) => {
    resetState();
    setFilter(selectedFilter);
  }

  // When the Throw Api error button is clicked
  const handleSetThrowError = () => {
    resetState();
    setShouldThrowError(true);
  }

  // When the Fetch data slowly button is clicked
  const handleSetFetchDataSpeed = () => {
    resetState();
    setFetchDataSpeed(5000);
  }

  return (
    <main className="App">
      <header className="App-header"></header>
      <section>
        <ButtonGroup
          data={data}
          filter={filter}
          loading={loading}
          onFilterApplied={handleSetFilter}
          onFetchDataSpeed={handleSetFetchDataSpeed}
          onSetThrowError={handleSetThrowError}
        />

        {loading &&
          <div className='loading-state d-flex flex-column align-items-center justify-content-center'>
            <h3>Just one moment please...</h3>
            <Spinner animation="grow" variant="info" />
          </div> }

        {!loading && error && (
          <div className='error-state d-flex flex-column align-items-center justify-content-center'>
            <h2>There was a problem fetching FizzBuzz data</h2>
            <h3>{error}</h3>
            <img src={SadPanda} alt="Sad panda" className='fluid'/>
          </div>
        )}

        {!loading && data && data.length && <FBTable data={data} filter={filter}/>}
      </section>
    </main>
  )
}

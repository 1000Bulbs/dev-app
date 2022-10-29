import React, { useState, useEffect } from "react";
import './App.css';

export default function App() {
  const [data, setData] = useState(null);
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
        setError(null);
      })
      .catch((err) => {
        setError(err.message);
        setData(null);
      })
      .finally(() => {
        setLoading(false);
      });
  }, []);

  return (
    <div className="App">
      <header className="App-header"></header>
      <section>
        { loading && <div>A moment please...</div> }
        { error && (<><p>There was a problem fetching FizzBuzz data</p><p>{error}</p></>)}

        {data && data.map(({ num, say }) => (
          <div key={num}>
            <h3>{num}: {say}</h3>
          </div>
        ))}
      </section>
    </div>
  )
}

import { useState } from 'react'
import './App.css'
import FizzBuzz from './Components/FizzBuzz';


function App() {

  const [input,setInput] = useState('');
  const [valid,setValid] = useState(null);
  const [renderSolution,setRenderSolution] = useState(false);

  const regex = new RegExp('^0*(?:[1-9][0-9]?|100)$');


 

  const handleSubmit = (e) =>{
      e.preventDefault();
      setRenderSolution(true);
  }

  const handleChange = e =>{
    const validInput = regex.test(e.target.value);
    setInput(e.target.value);
    if(!validInput) return setValid(false); setRenderSolution(false);
    setValid(true);  
  }

  return (
    <>
      <div className="App">
        <h1>Fuzzz Buzzz!</h1>
        <form onSubmit={(e)=>handleSubmit(e)} className='form'>
          <label htmlFor='number'>Please enter a number (1-100)</label>
          {valid === false && (<h3>Input must be a number between 1-100!</h3>)}        
          <input className={valid !== null ? valid ? 'valid': 'error':''} id='number' type={'text'} value={input} onChange={(e)=>handleChange(e)} />
          <input className='inputButton' type='submit' />
        </form>
      </div>
      {renderSolution === true && valid && (
        <FizzBuzz input={input} />
      )}
    </>
  )
}

export default App

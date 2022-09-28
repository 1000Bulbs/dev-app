import React, { useState } from 'react'
import './fizzbuzz.css'



const FizzBuzz = (props) => {

  const {input} = props;
  const elements = [];

  const [currentModal , setCurrentModal] = useState(null);

  const fizzModal = (num) =>{
    return <div className='modal'>
            <div><span>#{num} is Fuzz!</span></div>
            <img src='/fizz.jpg'/>
            <button onClick={()=>setCurrentModal(null)}>Close</button>
          </div>
  }

  const buzzModal = (num) =>{
    return <div className='modal'>
            <div><span>#{num} is Buzz!</span></div>
            <img src='/buzz.png'/>
            <button onClick={()=>setCurrentModal(null)}>Close</button>
          </div>
  }

  const fuzzBuzzModal = (num) =>{
    return <div className='modal'>
            <div><span>#{num} is Fun Buzz!! I mean FuzzBuzz :)..</span></div>
            <img src='/fuzzbuzz.jpg'/>
            <button onClick={()=>setCurrentModal(null)}>Close</button>
          </div>
  }

  const handleModalChange = (modalType,num) => {
    if(modalType === 'Fuzz') return setCurrentModal(fizzModal(num));
    if(modalType === 'Buzz') return setCurrentModal(buzzModal(num));
    if(modalType === 'FuzzBuzz') return setCurrentModal(fuzzBuzzModal(num));
    return setCurrentModal(null);
  }


  // For printing to console
  const fizzBuzz = (num) => {
    if(num % 15 === 0) return console.log('FuzzBuzz');
    if(num % 3 === 0) return console.log('Fuzz');
    if(num % 5 === 0) return console.log('Buzz');
    return console.log(num);
  }
  // For printing to console
  for(let i = 1;i<=input;i++){
    fizzBuzz(i);
  }

  // For creating span elements
  const fizzBuzzElements = (num) => {
    if(num % 15 === 0) return <span key={num} onClick={() => handleModalChange('FuzzBuzz',num)}>{num}: FuzzBuzz</span>;
    if(num % 3 === 0) return <span key={num} onClick={() => handleModalChange('Fuzz',num)}>{num}: Fuzz</span>; 
    if(num % 5 === 0) return <span key={num} onClick={() => handleModalChange('Buzz',num)}>{num}: Buzz</span>;
    return <span className='noModal'>{num}</span>;
  }
  // For creating span elements
  for(let i = 1;i<=input;i++){
    elements.push(fizzBuzzElements(i));
  }
  

  return (
    
      <div className='fizzbuzz'>
        <h1>FizzBuzz Results! <h3>Click words for content.</h3></h1>
        {elements.length > 0 && elements.map(elem=>(
          elem
        ))}
        {currentModal && (
          <div className='modalcontainer'>
            {currentModal}
          </div>
        )}
      </div>
    
  )
}

export default FizzBuzz
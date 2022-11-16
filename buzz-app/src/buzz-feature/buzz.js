

import "./Buzz.css";
import { useState } from "react";
import {AiFillBulb} from "react-icons/ai";
import { AiFillThunderbolt } from "react-icons/ai";



function Buzz() {
 
    
const[enteredAmount, setEnteredAmount ] = useState("");
const [submittedAmount, setSubmittedAmount] = useState(null);

     function valueChangeHandler(event) {
       
       setEnteredAmount(event.target.value);
       console.log(enteredAmount);
     }
  
   function submitHandler(event) {
        event.preventDefault();
        setSubmittedAmount(enteredAmount);
       
   }
   const myArray = [];
   for (let i = 1; i <= submittedAmount; i++) {
     myArray.push(i);
   }
   console.log(myArray);
  
    return (
      <div className="main-div">
        <div className="upper-component">
          <h1>Buzz Feature</h1>

          <form onSubmit={submitHandler}>
            <label>Please enter how many Buzzez we are to get going </label>
            <input
              type="number"
              min="0"
              step="10"
              onChange={valueChangeHandler}
            />

            <div className="button-style">
              <button variant="primary" type="submit" className="button-5">
                <AiFillThunderbolt style={{ color: "yellow" }} />
                Lets Begin The Buzz
                <AiFillThunderbolt style={{ color: "yellow" }} />
              </button>
            </div>
          </form>
        </div>
        <div className="light-div">
          {myArray.map((reptile) =>
            reptile % 3 === 0 ? (
              <AiFillThunderbolt style={{ color: "yellow" }} />
            ) : (
              <AiFillBulb style={{ color: "white" }} />
            )
          )}
        </div>
      </div>
    );
}

export default Buzz;

$(document).ready(function () {


  //API Call & Checking fizzBuzz value with external data source
  $('#submit-button').on('click',function(event){
    event.preventDefault();
    let startNum = $('#start-number').val();
    let endNum = $('#end-number').val();
    
    let limitReturns = endNum;
    let queryURL = `https://fibuzzapi.herokuapp.com/api/numbers?limit=${limitReturns}`;
    
    let testList = [];
    let logicList = [];

    $('#display-items').empty();
      for (let i = startNum; i <= endNum; i++) {
        switch (true) {
          case i % 5 == 0 && i % 3 == 0:
            console.log("FizzBuzz" + " " + i)
            logicList.push(new Object({
              id:i,
              value:"FizzBuzz"
            }))
            break;
          case i % 5 == 0:
            console.log("Buzz") ;
            logicList.push(new Object({
              id:i,
              value:"Buzz"
            }))
            break;
          case i % 3 == 0:
            console.log("Fizz") ;
            logicList.push(new Object({
              id:i,
              value:"Fizz"
            }))
            break;
          default:
            console.log("Not Fizz Nor Buzz") ;
            logicList.push(new Object({
              id:i,
              value: i
            }))
        }
      }
    logicList.forEach(function(element,i){

      $('#display-items').append(`
      <tr>
       <td><h5 id="${i}">${element.id}</h5></td>
       <td><h5>${element.value}</h5></td> 
       <td><h5 id="test-${i}" data-value="${element.value}"></h5></td>
      </tr>
      `)
    })
    $.ajax({
      method: "GET",
      url: queryURL,
    }).then(function(response){
      testList.pop();
      testList = [...response.numbers]
      testList.forEach(function(element,i){
        let testValue = $(`#test-${i}`).data('value');
        if (testValue == element.value){
          $(`#test-${i}`).append(`Pass`).css({
            "background":"darkolivegreen",
            "color":"white"
          })
        } else {
          $(`#test-${i}`).append(`Fail`).css({
            "background":"darkred",
            "color":"white"
          });
        };
      });
    });

  });
});


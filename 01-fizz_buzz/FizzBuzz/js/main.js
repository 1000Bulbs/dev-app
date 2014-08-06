// Fancy Stuff
setTimeout(function(){
	$('.container').css("-webkit-transition","all 1.5s ease");
	$('.container').css("-webkit-transform","rotate(360deg)");
}, 0);

// Delay the fancy stuff
setTimeout(function(){
// Set variables
var FizzBuzzStringCool = "";
var FizzBuzzStringLame = "";
var Fizz;
var Buzz;

// OCD (Pad the 0s so everything lines up)
function zeroPad(num, places) {
  var zero = places - num.toString().length + 1;
  return Array(+(zero > 0 && zero)).join("0") + num;
}

// Start for loop 1-100
for (var a=1;a<=100;a++)
{
    // Divisible by 3
	Fizz = a%3 == 0;
	// Divisible by 5
    Buzz = a%5 == 0;
	
	// Check if divisible by both
    if ((Fizz&&Buzz))
    {
        FizzBuzzStringCool+= '<span class="number">'+zeroPad(a, 3)+':</span>' + '&nbsp &nbsp &nbsp' + '<span class="fizzbuzz"><span class="hireHagan">HIRE HAGAN</span> &nbsp (I mean "FIZZBUZZ")</span>';
    }
	// Check if divisible by just 3 (If not divisible by both)
	else if(Fizz)
    {
        FizzBuzzStringCool += '<span class="number">'+zeroPad(a, 3)+':</span>' + '&nbsp &nbsp &nbsp' + '<span class="fizzbuzz">FIZZ</span>';
    }
	// Check if divisible by just 5 (If not divisible by both)
    else if (Buzz)
    {
        FizzBuzzStringCool += '<span class="number">'+zeroPad(a, 3)+':</span>' + '&nbsp &nbsp &nbsp' + '<span class="fizzbuzz">BUZZ</span>';
    }
	// Check if number doesnt meet any other criteria
	else if(!(Fizz||Buzz))
    {
        // Binary because I am cool
		FizzBuzzStringCool+= '<span class="number">'+zeroPad(a, 3)+':</span>' + '&nbsp &nbsp &nbsp' + a.toString(2);
    }
	// Display results
    FizzBuzzStringCool+="<br />"
}
// Display coolness
document.getElementById('coolResults').innerHTML = FizzBuzzStringCool;


for (var a=1;a<=100;a++)
{
    // Divisible by 3
	Fizz = a%3 == 0;
	// Divisible by 5
    Buzz = a%5 == 0;
	
	// Check if divisible by both
    if ((Fizz&&Buzz))
    {
        FizzBuzzStringLame += " FIZZ BUZZ";
    }
	// Check if divisible by just 3 (If not divisible by both)
	else if(Fizz)
    {
        FizzBuzzStringLame += "FIZZ  ";
    }
	// Check if divisible by just 5 (If not divisible by both)
    else if (Buzz)
    {
        FizzBuzzStringLame += "BUZZ  ";
    }
	// Check if number doesnt meet any other criteria
	else if(!(Fizz||Buzz))
    {
        FizzBuzzStringLame+= a;
    }
	// Display results
    FizzBuzzStringLame+="<br />"
}
// Display coolness
document.getElementById('lameResults').innerHTML = FizzBuzzStringLame;
}, 1500);

// Set RegEx to default
var reTextFizz = new RegExp("FIZZ","g");
var reTextBuzz = new RegExp("BUZZ","g");

// Replace words function
function replaceText(f,b){
	
	// Get the location of string to replace
    var replaceString = document.getElementById("coolResults");
    var replaceTxt = replaceString.innerHTML;

    // Replace words
    replaceTxt = replaceTxt.replace(reTextFizz, f);
	replaceTxt = replaceTxt.replace(reTextBuzz, b);
    replaceString.innerHTML = replaceTxt;
	
	// Reset the variables
	document.getElementById('fizz').value = "";
	document.getElementById('buzz').value = "";
	
	//Save the RegEx state
	reTextFizz = new RegExp(f,"g");
	reTextBuzz = new RegExp(b,"g");
}

function alertInfo(){
	alert("This is a program that prints the numbers from 1 to 100. But for multiples of three 'Fizz' is printed instead of the number and for the multiples of five 'Buzz' is printed. For multiples of both, print 'FIZZBUZZ'.");
}
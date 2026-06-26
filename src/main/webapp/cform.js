/**
 * 
 */

window.onload = function() {
           // Get the input element 
           const inputField = document.getElementById('myInput');
           
           // Check if it already has a value
           if (inputField.value.trim() !== '') {
               // Auto-submit the form
               document.getElementById('myForm').submit();
           }
       };
	   
	   
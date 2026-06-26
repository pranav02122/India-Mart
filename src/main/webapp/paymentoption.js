/**
 * 
 */

document.addEventListener('DOMContentLoaded', function() {
           // Get all payment methods
           const paymentMethods = document.querySelectorAll('.payment-method');
           const radioButtons = document.querySelectorAll('input[name="payment"]');
           const upiApps = document.querySelectorAll('.upi-app');
           const placeOrderBtn = document.getElementById('place-order');
           
           // Add click event to payment methods
           paymentMethods.forEach(method => {
               method.addEventListener('click', function() {
                   // Find the radio button inside this method
                   const radio = this.querySelector('input[type="radio"]');
                   radio.checked = true;
                   
                   // Reset all methods
                   paymentMethods.forEach(m => {
                       m.classList.remove('selected');
                       const details = m.querySelector('.payment-detail');
                       details.style.display = 'none';
                   });
                   
                   // Select this method
                   this.classList.add('selected');
                   const details = this.querySelector('.payment-detail');
                   details.style.display = 'block';
               });
           });
           
           // Add click event to radio buttons
           radioButtons.forEach(radio => {
               radio.addEventListener('change', function() {
                   if (this.checked) {
                       const method = this.closest('.payment-method');
                       
                       // Reset all methods
                       paymentMethods.forEach(m => {
                           m.classList.remove('selected');
                           const details = m.querySelector('.payment-detail');
                           details.style.display = 'none';
                       });
                       
                       // Select this method
                       method.classList.add('selected');
                       const details = method.querySelector('.payment-detail');
                       details.style.display = 'block';
                   }
               });
           });
           
           // Add click event to UPI apps
           upiApps.forEach(app => {
               app.addEventListener('click', function() {
                   upiApps.forEach(a => a.classList.remove('selected'));
                   this.classList.add('selected');
               });
           });
           
           // Place order button click event
           placeOrderBtn.addEventListener('click', function() {
               const selectedPayment = document.querySelector('input[name="payment"]:checked');
               
               if (!selectedPayment) {
                   alert('Please select a payment method');
                   return;
               }
               
               if (selectedPayment.value === 'upi') {
                   const upiId = document.getElementById('upi-id').value;
                   const selectedApp = document.querySelector('.upi-app.selected');
                   
                   if (!upiId && !selectedApp) {
                       alert('Please enter UPI ID or select a UPI app');
                       return;
                   }
                   
                   if (selectedApp) {
                       alert(`Processing payment via ${selectedApp.querySelector('span').textContent}. You'll be redirected to complete payment.`);
                   } else {
                       alert(`Processing payment to UPI ID: ${upiId}. You'll receive a payment request shortly.`);
                   }
               } else {
                   alert('Your order has been placed successfully!.');
               }
           });
       });
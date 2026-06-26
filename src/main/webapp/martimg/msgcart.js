
    document.addEventListener('DOMContentLoaded', function() {
        // Check if there's a message parameter in the URL
        const urlParams = new URLSearchParams(window.location.search);
        const msg = urlParams.get('msg');
        
        // Show the appropriate message based on the parameter
        if (msg === 'valid') {
            showMessage("Product added successfully!");
        } else if (msg === 'available') {
            showMessage("Product already available in cart!");
        }
        
        function showMessage(text) {
            const successMessage = document.getElementById('success-message');
            successMessage.textContent = text;
            successMessage.style.display = 'block';
            
            // Hide the message after 10 seconds
            setTimeout(function() {
                successMessage.style.display = 'none';
            }, 10000);
        }
    });
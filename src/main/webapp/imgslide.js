/**
 * 
 */
var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}

// Automatic slideshow
var slideTimer = setInterval(autoSlide, 1000);

function autoSlide() {
  plusSlides(1);
}

// Stop automatic slideshow on hover
var slideShowContainer = document.getElementsByClassName("slideshow-container")[0];

slideShowContainer.addEventListener('mouseover', function() {
  clearInterval(slideTimer);
}, false);

// Restart automatic slideshow on mouseout
slideShowContainer.addEventListener('mouseout', function() {
  slideTimer = setInterval(autoSlide, 4000);
}, false);

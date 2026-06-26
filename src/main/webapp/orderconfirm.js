/**
 * 
 */
function createConfetti() {
           const colors = ['#4f46e5', '#4ade80', '#fb923c', '#f472b6', '#facc15'];
           const container = document.querySelector('.container');
           
           for (let i = 0; i < 50; i++) {
               const confetti = document.createElement('div');
               confetti.classList.add('confetti');
               
               // Random size
               const size = Math.random() * 10 + 5;
               confetti.style.width = `${size}px`;
               confetti.style.height = `${size}px`;
               
               // Random color
               const color = colors[Math.floor(Math.random() * colors.length)];
               confetti.style.backgroundColor = color;
               
               // Random shape
               const borderRadius = Math.random() > 0.5 ? '50%' : '0';
               confetti.style.borderRadius = borderRadius;
               
               // Random position
               const left = Math.random() * 100;
               confetti.style.left = `${left}%`;
               confetti.style.top = '0';
               
               // Add to DOM
               document.body.appendChild(confetti);
               
               // Animate
               const delay = Math.random() * 2;
               const duration = Math.random() * 2 + 2;
               
               confetti.style.animation = `floatConfetti ${duration}s ease-out forwards`;
               confetti.style.animationDelay = `${delay + 1}s`;
               
               // Clean up after animation
               setTimeout(() => {
                   confetti.remove();
               }, (delay + duration) * 1000);
           }
       }

       // Wait for page load then trigger confetti
       window.addEventListener('load', () => {
           setTimeout(createConfetti, 1000);
       });

       // Add button animations
       const buttons = document.querySelectorAll('.btn');
       buttons.forEach(btn => {
           btn.addEventListener('mouseenter', () => {
               btn.style.transform = 'translateY(-3px)';
               btn.style.boxShadow = '0 7px 14px rgba(0, 0, 0, 0.1)';
           });
           
           btn.addEventListener('mouseleave', () => {
               btn.style.transform = 'translateY(0)';
               btn.style.boxShadow = 'none';
           });
           
           btn.addEventListener('click', () => {
               btn.style.transform = 'scale(0.95)';
               setTimeout(() => {
                   btn.style.transform = 'scale(1)';
               }, 100);
           });
       });
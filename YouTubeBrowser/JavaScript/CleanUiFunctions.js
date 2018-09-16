
// create styles
function cleanupYouTubeToolbarStyles() {
  var style = document.createElement('style');
  style.type = 'text/css';
  style.innerHTML = `
    @media only screen and (max-width: 9999px) {
      #masthead-container ytd-topbar-logo-renderer {
        display: none !important;
      }
      
      #masthead-container #buttons.style-scope a[href="/upload"] {
        display: none !important;
      }
      
      #masthead-container .yt-simple-endpoint.style-scope.ytd-topbar-menu-button-renderer {
        display: none !important;
      }
    }

    @media only screen and (max-width: 500px) {
      #masthead-container {
        display: none !important;
      }
    }
  `;
  document.body.appendChild(style);
}

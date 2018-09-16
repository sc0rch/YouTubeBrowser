
// create styles
function cleanupYouTubeToolbarStyles() {
  var style = document.createElement('style');
  style.type = 'text/css';
  style.innerHTML = `
    /* looks dirty but overrides youtube styles */
    @media only screen and (max-width: 9999px) {
      /* hide youtube logo, because why not */
      #masthead-container ytd-topbar-logo-renderer {
        display: none !important;
      }
      
      /* hide upload button, no use in our app */
      #masthead-container #buttons.style-scope a[href="/upload"] {
        display: none !important;
      }
      
      /* hide grid-style menu used to select other google apps */
      #masthead-container .yt-simple-endpoint.style-scope.ytd-topbar-menu-button-renderer {
        display: none !important;
      }
    }

    /* hide whole top bar and clear margins when current width or is lower than threshold */
    @media only screen and (max-width: 500px), only screen and (max-height: 350px) {
      #masthead-container {
        display: none !important;
      }
      
      #page-manager.ytd-app {
        margin: 0px !important;
      }
      
      #page-manager > .ytd-page-manager > #top {
        margin: 0px !important;
      }
    }
  `;
  document.body.appendChild(style);
}

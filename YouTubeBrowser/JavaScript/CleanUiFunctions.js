
// selectors
var youtubeToolbarSelector = '#masthead-container';
var youtubeToolbarLogoSelector = 'ytd-topbar-logo-renderer';
var youtubeToolbarUploadSelector = '#buttons.style-scope a[href="/upload"]';
var youtubeToolbarGridMenuSelector = 'ytd-topbar-menu-button-renderer';

// css classes
var styleYtbAutohideToolbar = 'ytb-autohideToolbar';

// create styles
function cleanupYouTubeToolbarStyles() {
  var style = document.createElement('style');
  style.type = 'text/css';
  style.innerHTML = `
    @media only screen and (max-width: 500px) {
      .ytb-autohideToolbar {
        display: none;
      }
    }`;
  document.body.appendChild(style);
}

// cleanup YouTube toolbar
function cleanupYouTubeToolbar() {
  // add class to autohide toolbar when width is too low
  var youtubeToolbar = document.querySelector(youtubeToolbarSelector);
  if (youtubeToolbar != null) {
    if (youtubeToolbar.classList != null) {
      youtubeToolbar.classList.add(styleYtbAutohideToolbar);
    } else {
      youtubeToolbar.class = styleYtbAutohideToolbar;
    }
  }
  
  // hide logo
  var logo = document.querySelector(youtubeToolbarLogoSelector);
  if (logo != null) {
    logo.hidden = true;
  }
  
  // hide upload button
  var upload = document.querySelector(youtubeToolbarUploadSelector);
  if (upload != null && upload.parentElement != null) {
    upload.parentElement.hidden = true;
  }
  
  // hide grid menu button
  var gridMenu = document.querySelector(youtubeToolbarGridMenuSelector);
  if (gridMenu != null) {
    gridMenu.hidden = true;
  }
}

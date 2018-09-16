
function installMiniPlayerStyles() {
  var style = document.createElement('style');
  style.type = 'text/css';
  style.innerHTML = `
  @media screen and (max-width: 9999px) {
    .ytb-miniplayer #masthead-container {
      display: none !important;
    }
    
    .ytb-miniplayer #page-manager.ytd-app {
      margin: 0px !important;
    }
    
    .ytb-miniplayer #page-manager > .ytd-page-manager > #top {
      margin: 0px !important;
    }
    
    .ytb-miniplayer #page-manager > .ytd-page-manager > #top > #container.style-scope.ytd-watch {
      display: none !important;
    }
    
    .ytb-miniplayer #page-manager > .ytd-page-manager > #top > #player.style-scope.ytd-watch {
      position: fixed !important;
      width: 100% !important;
      height: 100% !important;
      left: 0px !important;
      top: 0px !important;
    }
    
    .ytb-miniplayer .video-stream.html5-main-video {
      width: 100% !important;
      height: auto !important;
      left: 0px !important;
      top: 0px !important;
    }
    
    .ytb-miniplayer .html5-video-player > .ytp-chrome-bottom {
      margin-left: -12px !important;
      width: 100% !important;
    }
  }
  `;
  document.body.appendChild(style);
}

function enableMiniPlayerStyle() {
  document.querySelector('body').classList.add("ytb-miniplayer");
}

function disableMiniPlayerStyle() {
  document.querySelector('body').classList.remove("ytb-miniplayer");
}

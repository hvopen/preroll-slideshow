/**

Capture meetup site to a file

*/

var page = require('webpage').create();
page.viewportSize = { width: 1800, height: 1024 };
page.clipRect = { top: 0, left: 300, width: 1200, height: 1024 };
page.open('https://mhvlug.org', function() {
  page.render('images/mhvlug.png');
  phantom.exit();
});

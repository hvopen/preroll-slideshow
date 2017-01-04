/**

Capture meetup site to a file

*/

var page = require('webpage').create();
page.viewportSize = { width: 1800, height: 1024 };
page.clipRect = { top: 290, left: 300, width: 1200, height: 1024 };
page.open('http://www.meetup.com/mhvlug/', function() {
  page.render('images/meetup.png');
  phantom.exit();
});

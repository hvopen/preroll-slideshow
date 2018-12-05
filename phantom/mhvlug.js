/**

Capture meetup site to a file

*/

var page = require('webpage').create();
page.viewportSize = { width: 1200, height: 1024 };
page.clipRect = { top: 0, left: 0, width: 1200, height: 1024 };
page.open('https://hvopen.org/', function() {
  page.render('images/hvopen.png');
  phantom.exit();
});

// Google Apps Script Code
function doPost(e) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var data = JSON.parse(e.postData.contents);
  
  var timestamp = new Date();
  var loadAverage = data.load_average;
  
  // Append timestamp and load average to the sheet
  sheet.appendRow([timestamp, loadAverage]);
  
  return ContentService.createTextOutput("Success").setMimeType(ContentService.MimeType.TEXT);
}

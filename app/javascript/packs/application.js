// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
import "@fortawesome/fontawesome-free/js/all";


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
$(document).on("change","select#product_master_list_id", function(e) {
  $.ajax({
    type: "GET",
    url: "/master_lists/" + $(this).val() ,
    dataType: "script",
  });
});

$(document).on('click', '#printProductDetails', function(e) {
  e.preventDefault();
  e.stopPropagation();
  var printable_id = $(this).data("area");
  var data = $('#' + printable_id).html();
  openPrintableWindow(data);
});

function openPrintableWindow(div) {
  var w = window.open();
  w.document.write('<html><head><title></title>');
  w.document.write('<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" type="text/css" />');
  w.document.write("</head><body>");
  w.document.write(div);
  w.document.write('</body></html>');
  w.document.close();
  w.focus();
  setTimeout(function () {
    w.print();
    w.close();
  }, 500);
  return true;
}

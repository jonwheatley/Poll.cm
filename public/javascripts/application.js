// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  if ($("#results").length > 0) {
    setTimeout(refreshpage, 10000);
  }
});

function refreshpage () {
  var question_id = $("#results").attr("data-id")
  $.getScript("/results.js?id=" + question_id)
  setTimeout(refreshpage, 10000);
}


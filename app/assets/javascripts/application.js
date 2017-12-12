// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require typeahead.bundle
//= require bootstrap-tagsinput.min
//= require chartkick
//= require_tree .


$(document).on('turbolinks:load', function() {
  $( document ).ready(function() {
  })
});


function TagsInput(anchor, collection) {
  var keywordslst = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    prefetch: {
      // collection это полный путь к твоему JSON.
      url: collection,
      filter: function(list) {
        return $.map(list, function(keyword) {
          return { name: keyword }; });
      }
    }
  });
  keywordslst.initialize();
  // anchor - идентификатор твоего поля инпут (ex: "#keywords")
  $(anchor).tagsinput({
    typeaheadjs: {
      name: 'keywordslst',
      displayKey: 'name',
      valueKey: 'name',
      source: keywordslst.ttAdapter()
    },
    freeInput: false
  });
}

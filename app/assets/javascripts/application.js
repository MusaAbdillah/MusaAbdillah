// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require twitter/bootstrap
//= require bootstrap-sprockets
//= require data-confirm-modal
//= require turbolinks
//= require_tree .


//method untuk preview image sebelum di upload
function previewImage() {
document.getElementById("image-preview").style.display = "block";
var oFReader = new FileReader();
 oFReader.readAsDataURL(document.getElementById("image-source").files[0]);

oFReader.onload = function(oFREvent) {
  document.getElementById("image-preview").src = oFREvent.target.result;
  };
};

//method untuk data konfirmasi
dataConfirmModal.setDefaults({
  title: 'Konfirmasi',
  commit: 'Ya',
  cancel: 'Tidak'
});

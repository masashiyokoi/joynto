/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("@coreui/coreui-pro")
require("@coreui/icons-pro")
require("@coreui/icons")

import 'bootstrap'
// $(function() {
//   function readURL(input) {
//     if (input.files && input.files[0]) {
//       var reader = new FileReader();
//       reader.onload = function (e) {
//         $('#img_prev').attr('src', e.target.result);
//       }
//       reader.readAsDataURL(input.files[0]);
//     }
//   }
//   $("#post_post_img").change(function() {
//     readURL(this);
//   });
// });
// $(document).on('change', ':file', function() {
//     var input = $(this),
//     numFiles = input.get(0).files ? input.get(0).files.length : 1,
//     label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
//     input.parent().parent().next(':text').val(label);
// });

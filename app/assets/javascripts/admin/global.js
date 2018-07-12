var bucketRegion = 'us-east-2';
var IdentityPoolId = 'us-east-2:69a812f7-0a03-4616-b992-5b3ec15c7780';

AWS.config.update({
  region: bucketRegion,
  credentials: new AWS.CognitoIdentityCredentials({
    IdentityPoolId: IdentityPoolId
  })
});

var s3 = new AWS.S3({
  apiVersion: '2006-03-01',
  params: { Bucket: 'coax-folks-development' }
});

$(function() {
  $('.datepicker').datepicker({
    dateFormat: 'mm/dd/yy'
  });

  $('#track').on('change', function(event) {
    uploadStart();
    var file = $(this)[0].files[0];

    s3.upload({
      Key: file.name,
      Body: file
    }, function(err, data) {
      if (err) {
        console.log(err);
        return;
      }

      $('#setting_track').val(data['Location']);
      uploadEnd();
    })
    .on('httpUploadProgress', function(evt) {
      var progress = Math.ceil((evt.loaded / evt.total) * 100);
      $('.progress').html(progress + '%');
    })
  });
});

function uploadStart() {
  $('.uploading').show();
  $('input[type="submit"]').attr('disabled', true);
}

function uploadEnd() {
  $('.uploading').hide();
  $('input[type="submit"]').attr('disabled', false);
}

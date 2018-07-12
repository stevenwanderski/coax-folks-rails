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
    var $this = $(this);
    var file = $this[0].files[0];

    uploadStart($this);

    s3.upload({
      Key: file.name,
      Body: file
    }, function(err, data) {
      if (err) {
        console.log(err);
        return;
      }

      $('#setting_track').val(data['Location']);
      uploadEnd($this);
    })
    .on('httpUploadProgress', function(e) {
      updateProgress($this, e.loaded, e.total);
    })
  });

  $('#home_image').on('change', function(event) {
    var $this = $(this);
    var file = $this[0].files[0];

    uploadStart($this);

    s3.upload({
      Key: file.name,
      Body: file
    }, function(err, data) {
      if (err) {
        console.log(err);
        return;
      }

      $('#setting_home_image').val(data['Location']);
      uploadEnd($this);
    })
    .on('httpUploadProgress', function(e) {
      updateProgress($this, e.loaded, e.total);
    })
  });
});

function uploadStart($el) {
  $el.parent().find('.uploading').show();
  $('input[type="submit"]').attr('disabled', true);
}

function uploadEnd($el) {
  $el.parent().find('.uploading').hide();
  $('input[type="submit"]').attr('disabled', false);
}

function updateProgress($el, loaded, total) {
  var progress = Math.ceil((loaded / total) * 100);
  $el.parent().find('.progress').html(progress + '%');
}

class Track < ActiveRecord::Base
  mount_uploader :file, TrackUploader
end

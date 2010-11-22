class Image < PurpleAssetResource
  has_attached_file  :file,
    :styles => {
      :thumbnil => '180x180',
      :ipod => ['320x480',:mp4]
    },
    :processors => "video_thumbnail"
end

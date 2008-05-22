require 'asset_tag_helper_patches'

ActionController::Base.helper JsMaskHelper

unless File.exists?(RAILS_ROOT + '/public/javascripts/jsmask.js')
  dir     = '/public/javascripts/'
  source  = File.join(directory,dir)
  dest    = RAILS_ROOT + dir
  FileUtils.cp_r(Dir.glob(source+'/*.*'), dest)
end
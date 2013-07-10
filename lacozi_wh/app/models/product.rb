class Product < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  attr_accessible :category, :code, :description, :name, :picture
end

class Product < ActiveRecord::Base
  belongs_to :category
  #attr_accessible :photo
  has_attached_file :photo

end

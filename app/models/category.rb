class Category < ActiveRecord::Base
  acts_as_nested_set
  include TheSortableTree::Scopes

  has_many :product, :dependent => :nullify

  validates :title, :presence => true

  
end

class Story < ActiveRecord::Base
  acts_as_votable
  attr_accessible :category_id, :description, :title, :user_id
  belongs_to :category
  belongs_to :user

  attr_accessible :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

end

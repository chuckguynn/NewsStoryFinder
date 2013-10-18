class Story < ActiveRecord::Base
  acts_as_votable
  attr_accessible :category_id, :description, :title, :user_id
  belongs_to :category
  belongs_to :user

  attr_accessible :image

  has_attached_file :image,
  styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  },
  :storage => :s3,
  :s3_credentials => "#{Rails.root}/config/s3.yml"
end

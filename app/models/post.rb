class Post < ApplicationRecord
  has_attached_file :image, styles: { medium: "500x500>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of :title, format: { with: VALID_EMAIL_REGEX },
                                          uniqueness: true
  validates_presence_of :body
  validates_presence_of :category
  
  belongs_to :user, :foreign_key => "user_id"
  belongs_to :category
  # has_many :comments
  acts_as_commontable

  acts_as_votable
end

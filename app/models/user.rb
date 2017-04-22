class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar,  styles: { medium: "300x300>", thumb: "100x100>" }, convert_options: { thumb: "-quality 75 -strip", medium: "-quality 85 -strip"}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :name
  validates_uniqueness_of :name, if: -> { self.name.present? }
end

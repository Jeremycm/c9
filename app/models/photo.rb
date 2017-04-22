class Photo < ActiveRecord::Base
    has_many :comments, dependent: :destroy
    has_attached_file :image,  styles: { medium: "800x500>", thumb: "100x100>", large: "1300x600>" }, convert_options: { thumb: "-quality 75 -strip", medium: "-quality 85 -strip",  large: "-quality 95 -strip"}
    validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end

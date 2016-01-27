class Product < ActiveRecord::Base
has_attached_file :cover, styles: {medium: "800x600", thumb: "80x80" }
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
end

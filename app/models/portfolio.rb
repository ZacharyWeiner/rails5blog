class Portfolio < ApplicationRecord

  validates_presence_of :title, :body, :image, :thumb_image
end

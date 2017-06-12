class Skill < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :percent_utilized

  def set_default
    self.badge ||= Placeholder.image_generator(height:"200", width: "200")
  end
end

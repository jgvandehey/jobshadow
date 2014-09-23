class Opening < ActiveRecord::Base
  attr_accessible :description, :title, :company, :position, :location, :availability, :open
  belongs_to :user
  validates :user_id, presence: true
end

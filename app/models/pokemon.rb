class Pokemon < ActiveRecord::Base 
  validates :name, presence: true
  validates :name, length: { maximum: 10, message: "max length is 10" }
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only letter plz"} 
end

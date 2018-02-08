class Review
  include Mongoid::Document
  field :name, type: String
  field :rating, type: Integer
  field :title, type: String
  field :description, type: String
  
  belongs_to :book

  validates :rating, length: { minimum: 1, maximum: 5 }
end

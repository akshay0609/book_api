class ReviewSerializer < ActiveModel::Serializer
  attributes :name, :rating, :title, :description
end

class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :author_bio, :profile_pic, :academics, :awards

  has_many :books
end

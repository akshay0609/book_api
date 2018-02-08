class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :short_description, :long_description,
  					 :chapter_index, :date_of_publication, :genre, :reviews

  belongs_to :author	

  def reviews
  	object.reviews.map do |review|
      ::ReviewSerializer.new(review).attributes
    end
  end
end

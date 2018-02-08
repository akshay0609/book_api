class Book
  include Mongoid::Document
  field :name, type: String
  field :short_description, type: String
  field :long_description, type: String
  field :chapter_index, type: String
  field :date_of_publication, type: Date
  field :genre, type: String

  index({ name: 1 }, { background: true })

  belongs_to :author
  has_many :reviews

  scope :filter_by_title, lambda { |keyword| 
    where(name: /.*#{keyword}.*/i)
	}

	def self.search(params = {})
		books = Book.all
		books = books.filter_by_title(params[:title]) if params[:title].present?
		books
	end
end

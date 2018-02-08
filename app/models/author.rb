class Author
  include Mongoid::Document
  field :name, type: String
  field :author_bio, type: String
  field :profile_pic, type: String
  field :academics, type: String
  field :awards, type: String

  index({ name: 1 }, { background: true })

  has_many :books

  scope :filter_by_title, lambda { |keyword| 
    where(name: /.*#{keyword}.*/i)
	}

	def self.search(params = {})
		authors = Author.all
		authors = authors.filter_by_title(params[:title]) if params[:title].present?
		authors
	end
end

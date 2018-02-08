class Api::BooksController < ApplicationController
	before_action :authenticate_with_token!

	def index
		if params[:page].present? && params[:per_page].present?
			books = Book.search(params).paginate(:page => params[:page], :per_page =>  params[:per_page])
		else
			books = Book.search(params)
		end
		
		render json: books, meta: {
															pagination: {
																per_page: params[:per_page]
															}
														}
	end
end
class Api::SearchController < ApplicationController
	before_action :authenticate_with_token!

	def index
		@search_result = search_in_model(Book, params)
		@search_result = search_in_model(Author, params) if @search_result.blank?

		render json: @search_result, meta: {
															pagination: {
																per_page: params[:per_page]
																}
														}
	end
end
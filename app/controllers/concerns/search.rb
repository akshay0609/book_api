module Search
	def search_in_model(object, params)
		if params[:page].present? && params[:per_page].present?
			data = object.search(params).paginate(:page => params[:page], :per_page =>  params[:per_page])
		else
			data = object.search(params)
		end
		data
	end
end
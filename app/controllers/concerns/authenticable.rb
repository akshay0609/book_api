module Authenticable
	def current_user
		begin
			@current_user ||= User.find_by(auth_token: request.headers['Authentication'])
		rescue
			false
		end	
	end

	def authenticate_with_token!
		render json: {'error' => 'Invaild Authentication Token'}, status: :unauthorized unless current_user.present?
	end

  def user_signed_in?
    current_user.present?
  end
end
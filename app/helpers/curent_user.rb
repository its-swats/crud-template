helpers do

	def current_user
		@current_user ||= User.where(id: session[:id]).first if session[:id]
	end
	
end
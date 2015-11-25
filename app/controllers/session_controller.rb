#create new session page
get '/sessions/new' do
	if request.xhr?
		erb :'/sessions/_session_new', layout: false
	else
		redirect '/'
	end
end


#login to session
post '/sessions' do
	user = User.find_by(email: params[:email])
	if user && user.password = params[:password]
		session[:id] = user.id
		redirect '/'
	else
		flash[:errors] = ['Incorrect Username or Password']
		redirect '/sessions/new'
	end
end


#delete session
delete '/sessions/:id' do
	if request.xhr?
		current_user = nil
		session[:id] = nil
		redirect '/'
	else
		redirect '/'
	end
end

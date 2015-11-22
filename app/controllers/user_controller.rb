#show all users
get '/users' do
	@users = User.all
	erb :'/users/user_index'
end

#new user form
get '/users/new' do 
	if request.xhr?
		erb :'/users/_user_new', layout: false
	else
		status 403
		redirect '/'
	end
end

#create new user
post '/users' do 
	user = User.new(username: params[:username], email: params[:email])
	user.password = params[:password]
	if user.save
		session[:id] = user.id
		redirect '/'
	else
		status 400
		flash[:errors] = user.errors.full_messages
		redirect '/users/new'
	end
end

#get edit page
get '/users/:id/edit' do
	if request.xhr?
		@user = User.find(params[:id])
		erb :'/users/_user_edit', layout: false
	else
		status 403
		redirect '/'
	end
end

#show a user
get '/users/:id' do
	@user = User.find(params[:id])
end

#submit user edit
put '/users/:id' do 
	user = User.find(params[:id])
	user.username = params[:username]
	user.email = params[:email]
	if user.save
		redirect '/'
	else
		flash[:errors] = user.errors.full_messages
		redirect "/users/#{current_user.id}/edit"
	end
end

#delete user
delete '/users/:id' do 
	User.find(params[:id]).destroy
	session[:id] = nil
	current_user = nil
end



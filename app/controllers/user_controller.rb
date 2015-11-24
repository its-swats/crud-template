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
	if confirm_password
		user = User.new(username: params[:username], email: params[:email])
		user.password = params[:password]
		if user.save
			session[:id] = user.id
			redirect '/'
		else
			flash[:errors] = user.errors.full_messages
			redirect '/users/new'
		end
	else
		flash[:errors] = ['Your passwords did not match']
		redirect 'users/new'
	end
end

#auth for users edit
before '/users/:id/edit' do
	unless current_user.id == params[:id].to_i
		flash[:errors] = ['You are not permitted to access that page']
	end
end

#get edit page
get '/users/:id/edit' do
	if request.xhr?
		@user = User.find(params[:id])
		erb :'/users/_user_edit', layout: false
	else
		redirect '/'
	end
end

#show a user
get '/users/:id' do
	@user = User.find(params[:id])
	erb :'/users/_user_show', layout: false
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

private

def confirm_password
	return true if params[:password] == params[:confirm]
	false
end

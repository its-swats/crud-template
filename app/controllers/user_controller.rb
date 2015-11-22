#show all users
get '/users' do
	@users = User.all
	erb :'/users/user_index'
end

#new user form
get '/users/new' do 
	erb :'/users/user_new'
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
	end
end

#get edit page
get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :'/users/user_edit'
end

#show a user
get '/users/:id' do
	@user = User.find(params[:id])
end

#submit user edit
put '/users/:id' do 
	User.find(params[:id]).update(username: params[:username], email: params[:email])
	redirect '/'
end

#delete user
delete '/users/:id' do 
	User.find(params[:id]).destroy
	session[:id] = nil
	current_user = nil
end



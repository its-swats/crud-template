#show all users
get '/users' do
	@users = User.all
end

#show a user
get '/users/:id' do
	@user = User.find(params[:id])
end

#new user form
get '/users/new' do 
	erb :'/users/new'
end

#create new user
post '/users/' do 
	user = User.new(params[:username], params[:email])
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
	erb '/users/edit'
end

#submit user edit
put '/users/:id' do 
	user = user.find(params[:id])
	user.update(params)
end

#delete user
delete '/users/:id' do 
	User.find(params[:id]).destroy
	session[:id] = nil
end



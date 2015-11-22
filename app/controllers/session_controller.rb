#create new session page
get '/sessions/new' do 
	erb :'/sessions/session_new'
end


#login to session
post '/sessions' do 

end


#delete session
delete '/sessions/:id' do
	current_user = nil
	session[:id] = nil
end



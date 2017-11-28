$users = $mongo.collection('users')

get '/register' do
  erb :'users/signup_page', layout: :layout
end

post '/register' do
  require_fields(['email'])
  if $users.get(email: pr[:email])
    flash.message = ('Email already taken. Try to log in.') 
    redirect '/login'
  end
  user = $users.add(pr.just(:email))
  session[:user_id] = user['_id']
  flash.message = "Welcome, #{pr[:email]}"
  redirect '/'
end

get '/login' do
  erb :'users/login', layout: :layout
end

post '/login' do
  user = $users.get(email: pr[:email])
  if user 
    session[:user_id] = user['_id']
    flash.message = "Welcome back, #{pr[:email]}"
    redirect '/'
  else 
    flash.message = 'No such email'
    redirect '/' 
  end
end


get '/logout' do
  session.clear
  redirect '/'
end


#get '/terms/update' do get_phrases_from_gdoc end

# list of terms in the sentence that have a dictionary match (each with first translation)
# for each term - it's dictionary translations, synonyms, antonyms, related terms 
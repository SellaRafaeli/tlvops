$roles = $mongo.collection('roles')

ROLE_FIELDS = ['org_name', 'title', 'address']

get '/post_role' do
  erb :'roles/post_role', layout: :layout, locals: params
end

post '/role' do
  require_user
  require_fields(ROLE_FIELDS)
  data = pr.just(ROLE_FIELDS)
  $roles.add
end


#get '/terms/update' do get_phrases_from_gdoc end

# list of terms in the sentence that have a dictionary match (each with first translation)
# for each term - it's dictionary translations, synonyms, antonyms, related terms 
$roles = $mongo.collection('roles')

get '/terms' do
  erb :'terms/terms', layout: :layout, locals: params
end


#get '/terms/update' do get_phrases_from_gdoc end

# list of terms in the sentence that have a dictionary match (each with first translation)
# for each term - it's dictionary translations, synonyms, antonyms, related terms 
$ph = $phrases = $mongo.collection('phrases')

$phrases_gdoc_uri = 'https://spreadsheets.google.com/feeds/list/1X6FXXeo6WYbfN_m82zUFAt-FSJB5c3JjF6TH9j4RNk8/1/public/values?alt=json'

$terms_gdoc_uri = 'https://spreadsheets.google.com/feeds/list/1Sl1A85gCYZJwzZWYpPljAhu3EYw1R5lXctNV714uMh4/1/public/values?alt=json'

get '/phrases/:pid' do
  erb :'phrases/phrase_page', layout: :layout, locals: {ph: pr[:pid]}
end

get '/update' do 
  set_coll_from_gdoc($terms, $terms_gdoc_uri) 
  set_coll_from_gdoc($phrases, $phrases_gdoc_uri) 
end

$ph = $phrases = $mongo.collection('phrases')

def get_phrases_from_gdoc 
  $ph.delete_many
  gdoc_to_rows_arr('https://spreadsheets.google.com/feeds/list/1X6FXXeo6WYbfN_m82zUFAt-FSJB5c3JjF6TH9j4RNk8/1/public/values?alt=json').each {|p| p[:_id]=p[:pid]; $ph.add(p) } 
  "done. total: #{$ph.count} phrases"
end


get '/phrases/:pid' do
  erb :'phrases/phrase_page', layout: :layout, locals: {ph: pr[:pid]}
end

get '/update_phrases' do get_phrases_from_gdoc end
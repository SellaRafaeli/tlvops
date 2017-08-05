$ph = $phrases = $mongo.collection('phrases')

def get_phrases_from_gdoc 
  $ph.delete_many
  uri = 'https://spreadsheets.google.com/feeds/list/1X6FXXeo6WYbfN_m82zUFAt-FSJB5c3JjF6TH9j4RNk8/1/public/values?alt=json'
  arr = gdoc_to_rows_arr(uri)
  arr.each {|p|
    $ph.add(p)
  }
  "done. total: #{$ph.count} phrases"
end


get '/update_phrases' do get_phrases_from_gdoc end
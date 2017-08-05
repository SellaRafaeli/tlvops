$co = $convos = $mongo.collection('convos')

get '/convo/:id' do
  erb :'convos/convo', layout: :layout, locals: params
end
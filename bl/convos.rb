$co = $convos = $mongo.collection('convos')

get '/convos' do
  erb :'convos/convos', layout: :layout, locals: params
end

get '/convos/:id' do
  erb :'convos/convo', layout: :layout, locals: params
end
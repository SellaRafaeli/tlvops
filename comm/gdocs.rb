get '/admin/pull_gdoc' do
  #return {msg: "ok"}
  require_fields(['uri','col'])
  rows = gdoc_to_rows_arr(params[:uri])
  col  = $mongo.collection(params[:col])
  rows.each {|r| col.add(r) }
  flash.message="Added #{rows.size} items to #{params[:col]}"
  redirect '/admin'
end

def gdoc_to_rows_arr(uri)
  json       = JSON.parse(open(uri).read)['feed']['entry']
  data_cells = json.map { |row| kvs = row.select {|k,v| k.start_with?('gsx$') } } 
  ready_rows = data_cells.map {|row| row = row.map {|k,v| [k.sub('gsx$',''),v['$t'] ]; }.to_h }
  ready_rows
rescue => e
  {msg: e}
end

def set_coll_from_gdoc(coll,uri) 
  coll.delete_many
  gdoc_to_rows_arr(uri).each {|p| p[:_id]=p[:id]; coll.add(p) } 
  "done. total: #{coll.count} in #{coll.name}"
end
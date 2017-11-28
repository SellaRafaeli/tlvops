after do 
  request_time = Time.now - @time_started_request rescue nil
  log_request({time_took: request_time}) unless request_is_public?
  if @response.body.is_a? Hash #return hashes as json
    #@response.body = {data: @response.body}
    @response.body[:time] = request_time
    content_type 'application/json'
    @response.body = @response.body.to_json   
  end 
end

def mark_match(str,query = nil)
  if pr[:q]
    query ||= pr[:q]
    str.to_s.gsub(/#{query}/i,"<span class='match'>#{query}</span>")
  else 
    str
  end
end

get '/mw/outgoing' do 'refresh' end
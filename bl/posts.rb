$posts = $mongo.collection('posts')

POST_FIELDS = ['org_name','address','num_employees','title','text']

def get_posts
  if (pr[:q])
    $posts.search_anywhere(pr[:q])
  else 
    $posts.all
  end
end

get '/my_post' do
  post = $posts.get("#{cuid}_post") || {}
  erb :'posts/my_post', locals: {post: post}, layout: :layout
end

post '/my_post' do
  require_user
  data = pr.just(POST_FIELDS)
  data['email']   = cu['email']
  data['user_id'] = cuid
  $posts.update_id("#{cuid}_post",data,{upsert: true})
  flash.message = 'Thanks!' 
  redirect back #'/?type=recent'
end

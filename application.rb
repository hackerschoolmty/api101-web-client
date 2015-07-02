get '/' do
  erb :index, locals: { links: HsnewsRb::Link.all }
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  user = HsnewsRb::User.create(params)
  redirect to('/')
end

get '/links/:id' do
  link = HsnewsRb::Link.find(params[:id])
  comments = link.comments

  erb :link, locals: { link: link, comments: comments }
end

get '/sign_in' do
  erb :sign_in
end

post '/sign_in' do
  HsnewsRb::Session.instance.create_with_email_and_password(params[:email], params[:password])
  redirect to('/')
end

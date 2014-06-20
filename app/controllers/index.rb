require 'twitter'



get '/' do
  if session[:user_id]
    @handle = User.find(session[:user_id]).twitter_handle
  end
  erb :index
end

#SIGN UP ------------------------------------------
get '/sign_up' do

end

post '/create_user' do
  user = User.create(name: params[:name], twitter_handle: params[:twitter_handle], password: params[:password])
  session[:user_id] = user.id
  status 200
end

#SIGN IN ----------------------------------------------
post '/sign_in' do
  user = User.find_by_name(params[:name])
    if user.password == params[:password]
      session[:user_id] = user.id
      status 200
    else
      status 420
    end
    @name = user.twitter_handle
end

#SIGN OUT --------------------------------------------------

get '/sign_out' do
  if session[:user_id]
    session.clear
  else
    status 420
  end

end

#SEARCH -----------------------------------------------
post '/search_term' do


  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "p3v6n2DOouySLSWtubbrtwITs"
    config.consumer_secret     = "KF6FzH6bwN3OmSOpYfEZoVYjuAdMEbA56bW1iWtKxH7etSP80t"
    config.access_token        = "55049642-IwoX5n3YpI9IvevdOvX5XLMJaI8BtKhxtBc3QtJlI"
    config.access_token_secret = "yPqoQGSvn6HexNIEK3Ky8zYJccOc8ouB1o8lExC8lKH4t"
  end


  Search.create(term: params[:search], user_id: session[:user_id])

  @search_term = params[:search]
  handle = User.find(session[:user_id]).twitter_handle
  @friends = client.friends(handle).to_a

  @friends.each do |friend|
    Friend.create(user_id: session[:user_id], user_name: friend.screen_name, int8: friend.id)
  end

  @screen_names = []
  @friends.each do |name|
    @screen_names << name.screen_name
  end
  @timelines = []
  @screen_names.each do |sn|
    @timelines << client.user_timeline(sn)
  end
  @tweets = @timelines.flatten

  erb :friends
end



















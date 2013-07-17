get '/' do
  erb :index
end

post '/urls/:long_url' do
  # @url = Url.new(params[:long_url])
  @url.shot_url = #shorten the shit
  @url.save
  # create a new Url
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
end

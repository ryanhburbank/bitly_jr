get '/' do
  @urls = Url.all
  erb :index
end

post '/urls' do
  @url = Url.new(params[:url])
  puts @url.inspect
  @url.short_url = Url.shorten
  puts @url.inspect
  if @url.save
    redirect to ("/")
  else
    "Nope!"
  end
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
end

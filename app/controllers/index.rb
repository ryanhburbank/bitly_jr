get '/' do
  @urls = Url.all
  erb :index
end

post '/urls' do
  @url = Url.new(params[:url])
  @url.short_url = Url.shorten
  @url.save
  redirect to ("/")
end

# e.g., /q6bda
get '/:short_url' do
  @short_url = params[:short_url]
  @url = Url.find_by_short_url(@short_url)
  @url.clicks += 1
  @url.save
  redirect to ("#{@url.long_url}")
end

#this is the wrong way to do this
# get '/:url_id' do
#   @id = params[:url_id]
#   @url = Url.find(@id)  # redirect to appropriate "long" URL
#   redirect to ("#{@url.long_url}")
# end

require 'date'

# CSS
get '/stylesheets/*.css' do
  content_type 'text/css', :charset => 'utf-8'
  stylesheet = params[:splat]
  sass :"#{stylesheet}"
end

# index
get '/' do
  haml :index
end

helpers do
  def days_left
    now = Time.now
    today = Date.new(now.year, now.month, now.day)
    goal = Date.new(2010, 10, 28)
    offset = goal - today
    offset.to_i
  end
end

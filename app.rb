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
    # now = Time.now
    # today = Date.new(now.year, now.month, now.day)
    # goal = Date.new(2010, 10, 28)
    # offset = goal - today
    # offset.to_i
    today = DateTime.now
    goal = DateTime.new(2010,10,28,12,30,00)
    offset = goal - today
    hours,minutes,seconds,frac = Date.day_fraction_to_time(offset)
    days = hours / 24
    hours = hours % 24
    "#{days} days, #{hours} hours, #{minutes} minutes and #{seconds} seconds"
  end
end

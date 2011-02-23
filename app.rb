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
    today = DateTime.now
    goal = DateTime.new(2011,03,11,23,14,00)
    offset = goal - today
    hours,minutes,seconds,frac = Date.day_fraction_to_time(offset)
    days = hours / 24
    hours = hours % 24
    offset <= 0 ? "No more days left!" : "Only #{days} days, #{hours} hours, #{minutes} minutes and #{seconds} seconds left!"
  end
end

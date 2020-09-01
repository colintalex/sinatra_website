class SinatraWebsite < Sinatra::Base

  get '/' do
    erb :welcome, :layout => :template
  end
end

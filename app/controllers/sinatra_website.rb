class SinatraWebsite < Sinatra::Base

  get '/' do
    erb :welcome, :layout => :template
  end

  get '/work' do
    @projects = Project.all
    @graphics = Graphic.all
    erb :work, :layout => :template
  end
end

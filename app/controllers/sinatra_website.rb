class SinatraWebsite < Sinatra::Base
  use Rack::MethodOverride

  # use Rack::Auth::Basic do |username, password|
  #   username == 'admin' and password == 'admin'
  # end

  get '/' do
    erb :welcome, :layout => :template
  end

  get '/work' do
    @projects = Project.all
    @graphics = Graphic.all
    erb :work, :layout => :template
  end

  get '/admin' do
    # protected!
    @projects = Project.all
    @graphics = Graphic.all
    erb :dashboard, :layout => :template
  end

  get '/admin/projects/new' do
    # protected!
    erb :new_project, :layout => :template
  end

  post '/admin/projects' do
    proj = Project.new(params)
    if proj.save
      redirect '/admin'
    else
      redirect '/admin/projects/new'
    end
  end

  delete "/admin/projects/:id" do
    proj = Project.find(params[:id])
    proj.destroy
    redirect '/admin'
  end

  not_found do
    'This is nowhere to be found.'
  end
end

class SinatraWebsite < Sinatra::Base
  helpers do
    def protected!
      return if authorized?
      headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
      halt 401, "Not Authorized\n"
    end

    def authorized?
      @auth ||= Rack::Auth::Basic::Request.new(request.env)
      @auth.provided? and @auth.basic? and @auth.credentials and @auth.credentials == ['admin', 'admin']
    end
  end

  use Rack::Auth::Basic do |username, password|
    username == 'admin' and password == 'admin'
  end

  get '/' do
    erb :welcome, :layout => :template
  end

  get '/work' do
    @projects = Project.all
    @graphics = Graphic.all
    erb :work, :layout => :template
  end

  get '/admin' do
    protected!
    erb :dashboard, :layout => :template
  end
end

require './config/environment'
require 'sinatra'

class SinatraWebsite < Sinatra::Base
  use Rack::MethodOverride

  # use Rack::Auth::Basic do |username, password|
  #   username == 'admin' and password == 'admin'
  # end
  configure do
    set :method_override, true
    set :root, APP_ROOT
    set :views, File.join(APP_ROOT, 'app', 'views')
    set :public_folder, File.join(APP_ROOT, 'public')
  end

  get '/' do
    erb :welcome, :layout => :template
  end

  get '/work' do
    puts '1'
    @projects = Project.all
    puts '2'
    @graphics = Graphic.all
    puts 'done'
    erb :work, :layout => :template
  end

  get '/admin' do
    # protected!
    @projects = Project.all
    @graphics = Graphic.all
    erb :dashboard, :layout => :template
  end

  get '/admin/graphics/new' do
    erb :new_graphic, :layout => :template
  end

  post '/admin/graphics' do
    if params[:image] && params[:image][:filename]
      filename = params[:image][:filename]
      file = params[:image][:tempfile]
      path = "./public/uploads/#{filename}"

      File.open(path, 'wb') do |f|
        f.write(file.read)
      end
      params[:image] = "uploads/" + params[:image][:filename]
    end
    graphic = Graphic.new(params)
    if graphic.save
      redirect '/admin'
    else
      redirect '/admin/graphics/new'
    end
  end

  get '/admin/graphics/:id/edit' do
    @graphic = Graphic.find(params[:id])
    erb :edit_graphic, :layout => :template
  end

  patch '/admin/graphics/:id' do
    graphic = Graphic.find(params[:id])
    graphic.update(date: params[:date],
          description: params[:description],
                image: params[:image],
           work_hours: params[:work_hours])

    redirect '/admin'
  end

  delete "/admin/graphics/:id" do
    graphic = Graphic.find(params[:id])
    graphic.destroy
    redirect '/admin'
  end

  post "/admin/graphics/upload" do
    require "pry"; binding.pry
  end

  get '/admin/projects/new' do
    # protected!
    erb :new_project, :layout => :template
  end

  get '/admin/projects/:id/edit' do
    @project = Project.find(params[:id])
    erb :edit_project, :layout => :template
  end

  patch '/admin/projects/:id' do
    proj = Project.find(params[:id])
    proj.update(title: params[:title],
          description: params[:description],
                image: params[:image],
           github_url: params[:github_url],
           deploy_url: params[:deploy_url])
    redirect '/admin'
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

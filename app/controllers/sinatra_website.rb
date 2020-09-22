require 'sinatra/base'
require './config/environment'
require './app//helpers/application_helper'

class SinatraWebsite < Sinatra::Base
  set :database_file, './config/database.yml'

  helpers Sinatra::SinatraWebsite::ImageHelpers

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
    @projects = Project.all
    @graphics = Graphic.all
    erb :work, :layout => :template
  end

  get '/about' do
    erb :about, :layout => :template
  end

  get '/contact' do
    erb :contact, :layout => :template
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
    check_and_save_image(params)    
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
    check_and_save_image(params)    
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
    check_and_save_image(params)
    proj.update(title: params[:title],
          description: params[:description],
                image: params[:image],
           github_url: params[:github_url],
           deploy_url: params[:deploy_url])
    redirect '/admin'
  end

  post '/admin/projects' do
    check_and_save_image(params)
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

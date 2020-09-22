require 'sinatra/base'

module Sinatra
    module SinatraWebsite
        module ImageHelpers
            def check_and_save_image(params)
                if params[:image] && params[:image]['filename']
                    filename = params[:image]['filename']
                    file = params[:image][:tempfile]
                    path = "./public/uploads/#{filename}"

                    File.open(path, 'wb') do |f|
                        f.write(file.read)
                    end
                    params[:image] = "uploads/" + params[:image]['filename']
                end
            end
        end
    end
end
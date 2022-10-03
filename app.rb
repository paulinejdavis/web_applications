require 'sinatra/base'

class Application < Sinatra::Base

     get '/hello' do
        name = params[:name]

        return "Hello #{name}"
     end

    get '/names' do
        name = params[:name]

        return " #{name}"
    end

    post '/sort-names' do
        names = params[:names]
        return sort_names = names.split(',').sort.join(',')
    end

    #     name = params[:name]
       
    #     p name
       
    #     # return 'A list of posts'
    #     return "Hello #{name}."
    # end
    
    # get '/submit' do
    #     name = params[:name]
    #     message = params[:message]

    #     p name
    #     p message
    
    #     # return 'A list of posts'
    #     return "Thanks #{name}, you sent this #{message}:"
    # end

 

end
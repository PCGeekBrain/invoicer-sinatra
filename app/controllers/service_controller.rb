class ServiceController < ApplicationController

    get '/services' do
        authenticate!
        erb :"services/index"
    end

    get '/services/new' do
        authenticate!
        erb :"services/new"
    end

    get '/services/:id' do
        authenticate!
        erb :"services/show"
    end
    
    get '/services/:id/edit' do
        authenticate!
        erb :"services/edit"
    end

    post '/services/:id/edit' do
        authenticate!
        erb :"services/edit"
    end
    
    delete 'services/:id/delete' do
        authenticate!   #check that they are logged in at all
        service = Service.find_by(id: params[:id]) # get the item from the database
        validate_access(service)    #validate the user has access to the item
        service.delete  # and then delete it
        redirect '/services' # send the user back to the list of services after deleting a service (to delete more I guess)?
    end

end

class ClientsController < ApplicationController

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    # raise params.inspect
    if current_user.admin
      @client = Client.new(client_params)
      if @client.save
        redirect_to client_path(@client)
      else
        render :new  #lets us call field w/errors.  Keeps inputted data.  #renders users/new form.
      end
    end
  end

  def show
    # raise params.inspect
    set_client
  end

  def edit
    # raise params.inspect
    set_client
  end

  def update
    if current_user.admin
      set_client
      if @client.update(client_params)
        redirect_to client_path(@client)
      else
        render :edit #allows for field with errors.
      end
    end
  end

  def destroy
    if current_user.admin
      set_client
      @client.destroy
      redirect_to clients_path
    end
  end


  private

  def set_client
    @client = Client.find_by(id: params[:id])
    if !@client
      redirect_to clients_path
    end
  end

  def client_params
    params.require(:client).permit(:company_name, :email, :phone, :street_address, :city, :state, :zip, :contact_name)
  end

end

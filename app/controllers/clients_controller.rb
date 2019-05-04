class ClientsController < ApplicationController

  def index
  end

  def new
    @client = Client.new
  end

  def create
    # raise params.inspect
    @client = Client.create(client_params)
    if @client.save
      redirect_to client_path(@client)
    else
      render :new  #lets us call field w/errors.  Keeps inputted data.  #renders users/new form.
    end
  end

  def show
    # raise params.inspect
    @client = Client.find_by(id: params[:id])
  end


  private
    def client_params
      params.require(:client).permit(:name, :email, :phone, :street_address, :city, :state, :zip, :company)
    end

end

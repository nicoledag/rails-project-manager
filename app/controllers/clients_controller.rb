class ClientsController < ApplicationController

  def index
  end

  def new
    @client = Client.new
  end

  def create
    raise params.inspect
  end


end

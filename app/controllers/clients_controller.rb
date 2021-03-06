# frozen_string_literal: true

class ClientsController < OpenReadController
  before_action :set_client, only: %i[show update destroy]

  # GET /clients
  def index
    @clients = current_user.clients

    render json: @clients
  end

  # GET /clients/1
  def show
    render json: @clients
  end

  # POST /clients
  def create
    @client = current_user.clients.build(client_params)

    if @client.save
      render json: @client, status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy

    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = current_user.clients.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def client_params
    params.require(:client).permit(:name, :age, :description,
                                   :duration, :user_id)
  end
end

class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :update, :destroy]

  # GET /transactions
  def index
    @transactions = Transaction.all

    render json: @transactions
  end

  # GET /transactions/1
  def show
    render json: @transaction
  end

  # POST /transactions
  def create

    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      render json: @transaction, status: :created, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transaction_params
      new_hash = {}
      params[:data][:attributes].each do |key, value|
      new_hash[key.to_s.gsub("-","_")] = value
    end
      params[:data][:relationships].each do |key, value|
        if value[:data].kind_of?(Array)
          new_hash[(key.to_s.gsub("-","_").singularize) + "_id"] = value[:data].map {|i| i[:id]}
        else
          new_hash[(key.to_s.gsub("-","_").singularize) + "_id"] = value[:data][:id]
        end
      end
    new_params = ActionController::Parameters.new(new_hash)
    new_params.permit(
        :book_id,
        :user_id
    )
    end
end

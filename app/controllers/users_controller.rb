class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    @user = User.joins(:books).find(params[:id])
      if @user.update_attribute(user_params)
      render json:@user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      new_hash = {}
      params[:data][:attributes].each do |key, value|
        new_hash[key.to_s.gsub("-","_")] = value

    end

    if params[:data][:relationships][:"books"][:data]
      puts "----------"
      puts params[:data][:relationships][:"books"][:data]
      puts "----------"
      new_hash[:books_id] = params[:data][:relationships][:"books"][:data]

    end

    new_params = ActionController::Parameters.new(new_hash)
    new_params.permit(
      :user_id,
      :books_id
    )
    end
end

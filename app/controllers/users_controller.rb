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

  # GET /user
  def get_user_by_name
    if params[:name]
      user = User.where(name: params[:name]).first
    elsif params[:password]
      user = User.where(password: params[:password]).first
    render json: user
  else
    render json: user.errors, status: unprocessable_entity
  end
  end


  # POST /users
  def create
    @user = User.new(user_params)
    if !User.where(name: @user.name).exists?
      if @user.save
      render json: @user, status: :created, location: @user
      else
      render json:{errors:["Failed to save"]}, status:500
      end
    else
      render json:{errors:["Username already, try logging in instead"]}, status:401
    end
  end

  # PATCH/PUT /users/1
  def update
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
      if !params[:data][:relationships].nil?
        params[:data][:relationships].each do |key, value|
          if value[:data].kind_of?(Array)
            new_hash[(key.to_s.gsub("-","_").singularize) + "_id"] = value[:data].map {|i| i[:id]}
          else
            new_hash[(key.to_s.gsub("-","_").singularize) + "_id"] = value[:data][:id]
          end
        end
      end
      new_params = ActionController::Parameters.new(new_hash)
    new_params.permit(
      :name,
      :user_id,
      :books_id
    )
    end
end

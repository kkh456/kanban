class TopController < ApplicationController
  def index
    @lists = List.where(user: current_user).order("created_at ASC")
  end

  def edit
    @list = List.find(params[:id])
    @user = User.find_by(id: params[:id])
  end

  def update
    #@user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      redirect_to :root
    else
      render action: :edit
    end
  end

  protected
    def update_resource(resource, params)
      resource.update_without_password(params)
    end
end

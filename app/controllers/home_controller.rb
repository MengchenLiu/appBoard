class HomeController < ApplicationController

  def index
    @user = User.find_by(id:current_user.id)

    if @user.first
      application = Application.all
      application.each do |a|
        if a.defaultStatus
          UserApp.create app_id: a.id, user_id: @user.id, position: a.id
        end
      end
      @user.first = false
      @user.save
    end
    @app_id = UserApp.where(user_id:current_user.id)
    @app = @app_id.sort_by{|i| i.position}.map{|i| Application.find_by(id:i.app_id)}
  end

  def new
    @all = Application.all
    @unused = []
    @all.each do |a|
      if UserApp.where(user_id:current_user.id,app_id:a.id).blank?
        @unused.push(a)
      end
    end
  end

  def create
    @ap = UserApp.new
    @ap.user_id = current_user.id
    @ap.app_id = params["app_id"]
    @ap.position = params["app_id"]
    @ap.save!
    redirect_to "/"
  end

  def destroy
    d = UserApp.find_by(user_id:current_user.id, app_id:params["app_id"])
    d.destroy
    redirect_to "/"
  end

skip_before_action :verify_authenticity_token,:only => :sort
  def sort
    params[:application].each_with_index do |id, index|
      UserApp.where(app_id: id,user_id:current_user.id).update_all(position: index+1)
    end

  end


end

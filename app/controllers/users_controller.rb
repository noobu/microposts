class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update ]
    before_action :user_edit,only:[:edit,:update]
    
    
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  
  def new
    @user = User.new
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to @user , notice: 'プロフィールを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
     end
  end
  
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

 private
  
  def set_user
    @user= User.find(params[:id]) # urlでセットされているユーザーをとってきている
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :profile,:area,
                                 :password, :password_confirmation)
  end
  
  def user_edit
    unless @user == current_user
    redirect_to root_path
    end
  end
  
end

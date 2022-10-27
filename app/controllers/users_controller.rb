class UsersController < ApplicationController
  def index
    # @users = User.all
  end

  # def show
  # end

  # def new
  #     @article = current_user.articles.build
  # end

  def create
    @user = current_user.articles.build(user_params)
      if @user.save
          redirect_to article_path(@user), notice: '保存できました'
      else
          flash.now[:error] = '保存に失敗しました'
          render :new
      end
  end

  private
  def set_article
      @user = User.find(params[:id])
  end
end

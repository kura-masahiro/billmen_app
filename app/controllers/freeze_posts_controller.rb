class FreezePostsController < ApplicationController
   before_action :set_freeze_post, only: %i[show edit update destroy]
   before_action :authenticate_user!, except: :index

  def index
    @search = FreezePost.ransack(params[:q])
    @results = @search.result
    @freeze_posts = FreezePost.order(id: :asc)
  end

  def show

  end

  def new
    @freeze_post = FreezePost.new
  end

  def create
    @freeze_post = FreezePost.new(freeze_post_params)
    if @freeze_post.save
      redirect_to @freeze_post, notice: "投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def edit

  end

  def update
    if @freeze_post.update(freeze_post_params)
      redirect_to @freeze_post, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @freeze_post.destroy!
    redirect_to @freeze_post, alert: "削除しました"
  end

  private

  def set_freeze_post
    @freeze_post = FreezePost.find(params[:id])
  end

  def freeze_post_params
    params.require(:freeze_post).permit(:title, :content).merge(user_id: current_user.id)
  end

end

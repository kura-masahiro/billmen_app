class BoilPostsController < ApplicationController
  before_action :set_electric_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: :index

  def index
    @electric_posts = ElectricPost.order(id: :asc)
  end

  def show

  end

  def new
    @electric_post = ElectricPost.new
  end

  def create
    @electric_post = ElectricPost.new(electric_post_params)
    if @electric_post.save
      redirect_to @electric_post, notice: "投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def edit

  end

  def update
    if @electric_post.update(electric_post_params)
      redirect_to @electric_post, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @electric_post.destroy!
    redirect_to @electric_post, alert: "削除しました"
  end

  private

  def set_electric_post
    @electric_post = ElectricPost.find(params[:id])
  end

  def electric_post_params
    params.require(:electric_post).permit(:title, :content).merge(user_id: current_user.id)
  end

end

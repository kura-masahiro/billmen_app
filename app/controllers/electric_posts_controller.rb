class ElectricPostsController < ApplicationController
   before_action :set_electric_post, only: %i[show edit update destroy]
   before_action :authenticate_user!, except: :index

  def index
    @search = ElectricPost.ransack(params[:q])
    @results = @search.result if @search.present?
    @electric_posts = ElectricPost.order(id: :asc)
  end

  def show
    @likes_count = Like.where(electric_post_id: @electric_post.id).count
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

  def like_create
    @like = current_user.likes.new(user_id: current_user.id, electric_post_id: params[:electric_post_id])
    if @like.save!
      redirect_to @electric_post
    end
  end

  def like_destroy
    @like = Like.find_by(user_id: current_user.id, electric_post_id: params[:electric_post_id]) 
    if @like.destroy
      redirect_to @electric_post, alert: "削除しました"
    end
  end

  private

  def set_electric_post
    @electric_post = ElectricPost.find(params[:id])
  end

  def electric_post_params
    params.require(:electric_post).permit(:title, :content, :user_id, :like).merge(user_id: current_user.id)
  end

end

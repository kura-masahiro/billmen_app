class ElectricPostsController < ApplicationController
   before_action :set_electric_post, only: %i[show edit update destroy like_create like_destroy comment_create comment_destroy]
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
    if @electric_post.user_id != current_user.id
      @like = current_user.likes.new(electric_post_id: params[:id])
      if @like.save!
        redirect_to @electric_post
      end
    end
  end

  def like_destroy
    if @electric_post.user_id != current_user.id
      @like = Like.find_by(electric_post_id: params[:id]) 
      if @like.destroy
        redirect_to @electric_post
      end
    end
  end

  def comment_create
    @comment = current_user.comments.new(electric_post_id: params[:id], body: params[:body])
    if @comment.save
      redirect_to @electric_post
    else
      render :show
    end
  end

  def comment_destroy
    @comment = Comment.find_by(electric_post_id: params[:id]) 
      if @comment.destroy
        redirect_to @electric_post
      end
    end

  
  private

  def set_electric_post
    @electric_post = ElectricPost.find(params[:id])
  end

  def electric_post_params
    params.require(:electric_post).permit(:title, :content, :user_id, :like, :body, :comment).merge(user_id: current_user.id)
  end

end
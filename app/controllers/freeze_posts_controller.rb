class FreezePostsController < ApplicationController
   before_action :set_freeze_post, only: %i[show edit update destroy like_create like_destroy comment_create comment_destroy]
   before_action :authenticate_user!, except: :index

  def index
    @search = FreezePost.ransack(params[:q])
    @results = @search.result if @search.present?
    @freeze_posts = FreezePost.order(id: :asc)
  end

  def show
     @likes_count = Like.where(freeze_post_id: @freeze_post.id).count
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

  def like_create
    if @freeze_post.user_id != current_user.id
      @like = current_user.likes.new(freeze_post_id: params[:id])
      if @like.save!
        redirect_to @freeze_post
      end
    end
  end

  def like_destroy
    if @freeze_post.user_id != current_user.id
      @like = Like.find_by(freeze_post_id: params[:id]) 
      if @like.destroy
        redirect_to @freeze_post
      end
    end
  end

  def comment_create
    @comment = current_user.comments.new(freeze_post_id: params[:id], body: params[:body])
    if @comment.save
      redirect_to @freeze_post
    else
      render :show
    end
  end

  def comment_destroy
    @comment = Comment.find_by(freeze_post_id: params[:id]) 
      if @comment.destroy
        redirect_to @freeze_post
      end
    end

  
  private

  def set_freeze_post
    @freeze_post = FreezePost.find(params[:id])
  end

  def freeze_post_params
    params.require(:freeze_post).permit(:title, :content, :user_id, :like, :body, :comment).merge(user_id: current_user.id)
  end

end

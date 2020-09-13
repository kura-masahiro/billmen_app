class DangerPostsController < ApplicationController
   before_action :set_danger_post, only: %i[show edit update destroy like_create like_destroy comment_create comment_destroy]
   before_action :authenticate_user!, except: :index

  def index
    @search = DangerPost.ransack(params[:q])
    @results = @search.result if @search.present?
    @danger_posts = DangerPost.order(id: :asc)
  end

  def show
      @likes_count = Like.where(danger_post_id: @danger_post.id).count
  end

  def new
    @danger_post = DangerPost.new
  end

  def create
    @danger_post = DangerPost.new(danger_post_params)
    if @danger_post.save
      redirect_to @danger_post, notice: "投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def edit

  end

  def update
    if @danger_post.update(danger_post_params)
      redirect_to @danger_post, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @danger_post.destroy!
    redirect_to @danger_post, alert: "削除しました"
  end

   def like_create
     if @danger_post.user_id != current_user.id
      @like = current_user.likes.new(danger_post_id: params[:id])
      if @like.save!
        redirect_to @danger_post
      end
     end
   end

  def like_destroy
    if @danger_post.user_id != current_user.id
      @like = Like.find_by(danger_post_id: params[:id]) 
      if @like.destroy
        redirect_to @danger_post
      end
    end
  end

   def comment_create
    @comment = current_user.comments.new(danger_post_id: params[:id], body: params[:body])
    if @comment.save!
      redirect_to @danger_post
    end
   end

  def comment_destroy
    @comment = Comment.find_by(danger_post_id: params[:id]) 
      if @comment.destroy
        redirect_to @danger_post
      end
  end


  private

  def set_danger_post
    @danger_post = DangerPost.find(params[:id])
  end

  def danger_post_params
    params.require(:danger_post).permit(:title, :content, :user_id, :like, :body, :comment).merge(user_id: current_user.id)
  end

end
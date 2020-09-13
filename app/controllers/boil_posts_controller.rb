class BoilPostsController < ApplicationController
  before_action :set_boil_post, only: %i[show edit update destroy like_create like_destroy comment_create comment_destroy]
  before_action :authenticate_user!, except: :index

  def index
    @search = BoilPost.ransack(params[:q])
    @results = @search.result if @search.present?
    @boil_posts = BoilPost.order(id: :asc)
  end

  def show
      @likes_count = Like.where(boil_post_id: @boil_post.id).count
  end

  def new
    @boil_post = BoilPost.new
  end

  def create
    @boil_post = BoilPost.new(boil_post_params)
    if @boil_post.save
      redirect_to @boil_post, notice: "投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def edit

  end

  def update
    if @boil_post.update(boil_post_params)
      redirect_to @boil_post, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @boil_post.destroy!
    redirect_to @boil_post, alert: "削除しました"
  end

  def like_create
    if @boil_post.user_id != current_user.id
      @like = current_user.likes.new(boil_post_id: params[:id])
      if @like.save!
        redirect_to @boil_post
      end
    end
  end

  def like_destroy
    if @boil_post.user_id != current_user.id
      @like = Like.find_by(boil_post_id: params[:id]) 
      if @like.destroy
        redirect_to @boil_post
      end
    end
  end

   def comment_create
    @comment = current_user.comments.new(boil_post_id: params[:id], body: params[:body])
    if @comment.save!
      redirect_to @boil_post
    end
  end

  def comment_destroy
    @comment = Comment.find_by(boil_post_id: params[:id]) 
      if @comment.destroy
        redirect_to @boil_post
      end
  end

  private

  def set_boil_post
    @boil_post = BoilPost.find(params[:id])
  end

  def boil_post_params
    params.require(:boil_post).permit(:title, :content, :user_id, :like, :body, :comment).merge(user_id: current_user.id)
  end

end

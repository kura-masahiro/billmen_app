class BuildPostsController < ApplicationController
before_action :set_build_post, only: %i[show edit update destroy]
   before_action :authenticate_user!, except: :index

  def index
    @search = BuildPost.ransack(params[:q])
    @results = @search.result
    @build_posts = BuildPost.order(id: :asc)
  end

  def show

  end

  def new
    @build_post = BuildPost.new
  end

  def create
    @build_post = BuildPost.new(build_post_params)
    if @build_post.save
      redirect_to @build_post, notice: "投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def edit

  end

  def update
    if @build_post.update(build_post_params)
      redirect_to @build_post, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @build_post.destroy!
    redirect_to @build_post, alert: "削除しました"
  end

  private

  def set_build_post
    @build_post = BuildPost.find(params[:id])
  end

  def build_post_params
    params.require(:build_post).permit(:title, :content).merge(user_id: current_user.id)
  end

end
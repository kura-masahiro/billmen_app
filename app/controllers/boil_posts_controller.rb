class BoilPostsController < ApplicationController
  before_action :set_boil_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: :index

  def index
    @search = BoilPost.ransack(params[:q])
    @results = @search.result
    @boil_posts = BoilPost.order(id: :asc)
  end

  def show

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

  private

  def set_boil_post
    @boil_post = BoilPost.find(params[:id])
  end

  def boil_post_params
    params.require(:boil_post).permit(:title, :content).merge(user_id: current_user.id)
  end

end

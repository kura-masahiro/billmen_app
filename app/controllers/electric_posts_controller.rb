class ElectricPostsController < ApplicationController
   before_action :set_electric_post, only: %i[show edit update destroy]
  def index
    @electric_posts = ElectricPost.order(id: :asc)
  end

  def show

  end

  def new
    @electric_post = ElectricPost.new
  end

  def create
    electric_post = ElectricPost.create!(electric_post_params)
    redirect_to electric_post, notice: "投稿しました"
  end

  def edit

  end

  def update
    @electric_post.update!(electric_post_params)
    redirect_to @electric_post, notice: "更新しました"
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
    params.require(:electric_post).permit(:title, :content)
  end

end

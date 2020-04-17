class MemosController < ApplicationController

  before_action :authenticate_user

  before_action :ensure_correct_user,{only: [:edit,:update,:destroy]}

  def index
    @memos = Memo.all.order(created_at: :desc)
  end

  def show
    @memo = Memo.find_by(id: params[:id])
    @user = @memo.user
    @favos_count = Favo.where(memo_id: @memo.id).count
  end


  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(
      content: params[:content],
      user_id: @current_user.id
      )
    if @memo.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/memos/index")
    else
      render("memos/new")
    end
  end

  def edit
    @memo = Memo.find_by(id: params[:id])
  end

  def update
    @memo = Memo.find_by(id: params[:id])
    @memo.content = params[:content]
    if @memo.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/memos/index")
    else
      render("memos/edit")
    end
  end

  def destroy
    @memo = Memo.find_by(id: params[:id])
    @memo.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/memos/index")
  end


  def ensure_correct_user
    @memo = Memo.find_by(id: params[:id])
    if @memo.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/memos/index")
    end
  end
end

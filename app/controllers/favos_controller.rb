class FavosController < ApplicationController
  before_action :authenticate_user

  def create
    @favo = Favo.new(user_id: @current_user.id, memo_id: params[:memo_id])
    @favo.save
    redirect_to("/memos/#{params[:memo_id]}")
  end

  def destroy
    @favo = Favo.find_by(user_id: @current_user.id, memo_id: params[:memo_id])
    @favo.destroy
    redirect_to("/memos/#{params[:memo_id]}")
  end

end
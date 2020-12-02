class CommentsController < ApplicationController

  def create
    # @commentというインスタンス変数を定義
    # Commentモデルの新規オブジェクトを代入
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      # 詳細ページに戻るようrenderを使う
      render prototype_path
    end
  end

  # commentsコントローラーのprivateメソッドにストロングパラメーターをセット
  private

  # user_idとprototype_idもmerge
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end

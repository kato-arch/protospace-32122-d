class UsersController < ApplicationController
  def show
    # usersコントローラーのshowアクションにインスタンス変数@userを定義。
    # Pathパラメータで送信されるID値で、Userモデルの特定のオブジェクトを
    # 取得するように記述し、それを@userに代入した
    @user = User.find(params[:id])
  end
end

class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:edit, :update, :destroy]



  def index
    @prototypes = Prototype.all
  end

  def new 
    @prototype = Prototype.new
 
   end

  def create
    @prototype = Prototype.new(prototype_params)

    # 正常の場合、ルートパスに戻る
    if @prototype.save
      redirect_to root_path
     else
       # 異常の場合、投稿ページを再表示
      render new_prototype_path
    end

  end

  def show
    # Pathパラメータで送信されるID値で、P
    # rototypeモデルの特定のオブジェクトを取得
    # それを@prototypeに代入

    # Prototypeの情報をとってくる
    @prototype = Prototype.find(params[:id])
    # コメントする準備
    @comment = Comment.new
    # showアクションにインスタンス変数@commentsを定義し、
    # その投稿に紐づくすべてのコメントを代入するための記述
    @comments = @prototype.comments.includes(:user)
    
  end

  # editアクションにインスタンス変数@prototypeを定義した。
  # 且つ、Pathパラメータで送信されるID値で、Prototypeモデルの
  # 特定のオブジェクトを取得するように記述し、それを@prototypeに代入した

  # editアクション
  def edit

     # prototypesコントローラーにおいて、
     # 投稿者以外がeditアクションにアクセスしたら
     # トップページにリダイレクトするように記述した
    unless user_signed_in?
      redirect_to action: :index
    end

    # Prototypeの情報をとってくる
    @prototype = Prototype.find(params[:id])

  end
  
  # updateアクションにデータを更新する記述をし、
  # 更新されたときはそのプロトタイプの詳細ページに戻るような記述をした

  # updateアクション
  def update
    @prototype = Prototype.find(params[:id])

    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render edit_prototype_path
    end

  end



  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end



  private

  # def user_params
  #   devise_parameter_sanitizer.permit(:deviseの処理名, keys: [:許可するキー])
  # end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept,:image)
    .merge(user_id: current_user.id)
  end


end


# def create
#   Tweet.create(tweet_params)
# end

# private
# def tweet_params
#   params.require(:tweet).permit(:name, :image, :text)
# end
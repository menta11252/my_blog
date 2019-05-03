class PostsController < ApplicationController
  def index
  end

  def show 
    @post = Post.find(params[:id])
  end

  def new
    # postモデルのインスタンスを生成
    @post = Post.new
  end

  def create
    # Postモデルのインスタンスを生成(ストロングパラメータでデータを取得)
    # saveする
    # showページにリダイレクト
    @post =  Post.new(post_params)
    @post.save
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    #一件データを取得]
    @post = Post.find(params[:id])
    #updateメソッドを使用
    @post.update(post_params)
    #詳細画面にリダイレクト
    redirect_to @post


  end

  def destroy
  end


  # プライベートメソッドでストロングパラメータを作成
  private

  def post_params
    params.require(:post).permit(:title, :body, :category)
  end
end

class PostsController < ApplicationController
  def index
  end


  def index
  # 記事一覧用
  @posts = Post.all
  # 最新記事用
  @new_posts = Post.all
  @author = Author.first
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
    #一件データを取得
    @post = Post.find(params[:id])
    #updateメソッドを使用
    @post.update(post_params)
    #詳細画面にリダイレクト
    redirect_to @post


  end

  def destroy
    # 対象データを1件取得する
    @post = Post.find(params[:id])
    # デストロイアクションで消す
    @post.destroy
    # 一覧ページにリダイレクト
    redirect_to posts_path
  end


  # プライベートメソッドでストロングパラメータを作成
  private

  def post_params
    params.require(:post).permit(:title, :body, :category)
  end
end

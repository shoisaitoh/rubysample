require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  # GET /posts のテスト
  describe "GET #index" do
    # 正常なリクエストの場合
    context "with valid request" do
      # 事前準備: 複数のPostを作成する
      before do
        Post.create(title: "First Post", content: "This is the first post.")
        Post.create(title: "Second Post", content: "This is the second post.")
        get :index, format: :json # JSON形式でリクエストを送信
      end

      # ステータスコードが200 OKであること
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      # レスポンスボディがJSON形式であること
      it "returns json format" do
        expect(response.content_type).to eq "application/json; charset=utf-8"
      end

      # レスポンスボディにPostが2つ含まれていること
      it "returns two posts" do
        posts = JSON.parse(response.body)
        expect(posts.length).to eq(2)
      end

      # レスポンスボディの最初のPostのtitleが"First Post"であること
      it "returns the correct title for the first post" do
        posts = JSON.parse(response.body)
        expect(posts[0]["title"]).to eq("First Post")
      end
    end
  end

  # GET /posts/:id のテスト
  describe "GET #show" do
    # 正常なリクエストの場合
    context "with valid request" do
      # 事前準備: Postを作成する
      before do
        @post = Post.create(title: "Test Post", content: "This is a test post.")
        get :show, params: { id: @post.id }, format: :json # JSON形式でリクエストを送信
      end

      # ステータスコードが200 OKであること
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      # レスポンスボディがJSON形式であること
      it "returns json format" do
        expect(response.content_type).to eq "application/json; charset=utf-8"
      end

      # レスポンスボディのtitleが"Test Post"であること
      it "returns the correct title" do
        post = JSON.parse(response.body)
        expect(post["title"]).to eq("Test Post")
      end
    end

    # 存在しないIDでリクエストした場合
    context "with invalid request" do
      # 事前準備: 存在しないIDでリクエストを送信
      before do
        get :show, params: { id: 999 }, format: :json # 存在しないID
      end

      # ステータスコードが404 Not Foundであること
      it "returns http not_found" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
Blogit::Engine.routes.draw do

  # Keep these above the posts resources block
  get "posts/page/:page" => "posts#index"
  get "posts/tagged/:tag" => 'posts#tagged', as: :tagged_blog_posts
  get "posts/:year/:month" => 'posts#archives', as: :blog_posts_archives, constraints: { year: /\d{4}/, month: /\d/ }

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  get "/" => "posts#index", as: :blog_root
end

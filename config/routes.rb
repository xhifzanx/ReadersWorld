Rails.application.routes.draw do
  get 'dashboards/index'
  root to: 'mangas#index'
  devise_for :users 
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :mangas do
    resources :comments do
        resources :replies
    end
  	resources :chapters do
      resources :comment_chapters do
        resources :reply_chapters
      end
  		collection do
  			get ':id/attach_images'   => 'chapters#attach_images', as: :attach_images
  		end
  	end
  	collection do
  		get 'bookmark/:id/action' => 'mangas#bookmark_action', as: :bookmark
  		get 'categorized/:type'   => 'mangas#categorized', 	   as: :categorized
  		get 'sorted/:sort'        => 'mangas#sorted', 		     as: :sorted
      get 'search'              => 'mangas#search',          as: :search
  		get 'filter'              => 'mangas#filter',          as: :filter
  	end
  end
  resources :dashboards
  resources :categories

end

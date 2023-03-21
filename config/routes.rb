Rails.application.routes.draw do
  root to: 'mangas#index'
  devise_for :users

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
  		get 'sorted/:sort'        => 'mangas#sorted', 		   as: :sorted
  		
  	end
  end

  resources :categories

end

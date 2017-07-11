Rails.application.routes.draw do
		root		'members_pages#home'
		resources :users
end

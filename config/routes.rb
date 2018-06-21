Rails.application.routes.draw do
#	get 'undelete', :to => 'articles#undelete'
#	resources :articles
	get 'keywords', to: "welcome#index", as: :keywords
	resources :articles do
	  member do
	    put 'undestroy'
	  end
	  collection do
	    get 'undelete'
	    get 'embed'
	  end
	end
 
  	root 'welcome#index'
	get 'index_rus', to: "welcome#index_rus", as: :index_rus
	get 'index', to: "welcome#index", as: :index
end

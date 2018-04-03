Rails.application.routes.draw do
#	get 'undelete', :to => 'articles#undelete'
#	resources :articles
#	get 'keywords' to: "welcome#index", as: :keywords
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
end

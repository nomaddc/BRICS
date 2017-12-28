Rails.application.routes.draw do
#	get 'undelete', :to => 'articles#undelete'
#	resources :articles
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

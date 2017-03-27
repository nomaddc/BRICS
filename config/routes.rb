Rails.application.routes.draw do
#	get 'undelete', :to => 'articles#undelete'
#	resources :articles
	resources :articles do
	  member do
	    put 'undestroy'
	  end
	  collection do
	    get 'undelete'
	  end
	end
 
  	root 'welcome#index'
end

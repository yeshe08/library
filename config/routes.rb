Rails.application.routes.draw do
  get 'book_docs/view_pdf'
  post 'book_details/upload'
  get 'book_details/book_export'
  get 'entries/entry_export'
  get 'domains/domain_export'
  post "book_details/block_book"
  get "book_details/book_doc_delete"
  get "book_details/get_bookid" 
  get 'users/login'
  get 'users/logout'
  post 'users/login_auth'
  resources :entries
  resources :book_details
  resources :book_docs
  resources :publishers
  resources :authors
  resources :domains
  resources :users
  resources :roles
  root 'users#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

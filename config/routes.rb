Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
    #get "/all_products_path" =>"products#all_products_action"
    
    #get "/any_product_path" => "products#any_product_action"
    get "products" => "products#index"
    get "products/:id" => "products#show"
    post "products" => "products#create"
    patch "products/:id" => "products#update"
    delete "products/:id" => "products#destroy"

    post "/users" => "users#create"
    post"/sessions" => "sessions#create"
    post "/orders" => "orders#create"
    get "/orders" => "orders#index"
    get "/orders/:id" => "orders#show"

    post "/carted_products" => "carted_products#create"

    get "/carted_products" => "carted_products#index"

    # get "suppliers" => "suppliers#index"
    # get "suppliers/:id" => "suppliers#show"
    # post "suppliers" => "suppliers#create"
    # patch "suppliers/:id" => "suppliers#update"
    # delete "suppliers/:id" => "suppliers#destroy"


  end
end
#
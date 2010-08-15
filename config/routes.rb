SoCap::Application.routes.draw do
  
  match "color/blue" => "home#blue", :as => "color_blue"
  match "color/black" => "home#black", :as => "color_black"  
  match "color/green" => "home#green", :as => "color_green"
  
  resources :questions, :only => [:update]
  match "conference/:id/questions/edit" => "questions#edit", :as => "edit_conference_questions"
  match "questions/create" => "questions#create", :as => "create_questions", :via => 'post'
  match "conference/:id/questions/new" => "questions#new", :as => "new_question"

  resources :conference_attendees, :only => [:update]
  match "conference/attendees" => "conference_attendees#create", :as => "create_conference_attendees", :via => 'post'
  match "conference/:id/attendees/new" => "conference_attendees#new", :as => "new_conference_attendees"
  match "conference/:id/attendees/edit" => "conference_attendees#edit", :as => "edit_conference_attendees" 
  
  resources :answers
  
  resources :attendee_profiles, :only => [:show, :new, :create]
  match "attendee/profile/edit" => "attendee_profiles#edit", :as => "edit_attendee_profile"
  match "attendee/profile/update" => "attendee_profiles#update", :as => "update_attendee_profile", :via => "put"
  
  resources :organizer_profiles
  match "organizer/profile/edit" => "organizer_profiles#edit", :as => "edit_organizer_profile"
  match "organizer/profile/update" => "organizer_profiles#update", :as => "update_organizer_profile", :via => "put"
  
  resources :conferences
  match "attendee/matches/show" => "conferences#matches_show"
  match "conference/:id/questions" => "conferences#questions", :as => "conference_questions"
  match "conference/:id/attendees" => "conferences#attendees", :as => "conference_attendees", :via => "get"
  match "conference/:id/questions/edit" => "conferences#edit_questions", :as => "edit_conference_questions"
  match "conference/:id/details/edit" => "conferences#edit", :as => "edit_conference_details"
  match "conference/:id/match" => "conferences#match", :as => "conference_match"
  match "conference/match" => "conferences#make_matches", :as => "conference_make_matches", :via => "put"
  match "conference/:id/matches" => "conferences#matches", :as => "conference_matches"
  
  devise_for :organizers
  match "organizer/profile" => "organizers#profile", :as => "organizer_root"
  match "organizer/conferences" => "organizers#conferences", :as => "organizer_conferences"

  devise_for :attendees
  match "attendee/matches/select" => "conferences#matches_select", :as => "matches_select"
  match "attendee/profile" => "attendees#profile", :as => "attendee_root" 
  match "attendee/matches" => "attendees#matches", :as => "attendee_matches"
  match "attendee/conferences" => "attendees#conferences", :as => "attendee_conferences"  
  
  root :to => "home#index"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

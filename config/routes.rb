Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dashboard#display_main_screen"
  get 'display_main_screen' => 'dashboard#display_main_screen'
  get 'display_select_weed_screen' => 'dashboard#display_select_weed_screen'
  get 'display_statistics_screen' => 'dashboard#display_statistics_screen'
  get 'display_setup_screen' => 'dashboard#display_setup_screen'
  get 'update_setup' => 'dashboard#update_setup'
  get 'update_dosage' => 'dashboard#update_dosage'
  get 'transmit_and_clear_counts' => 'dashboard#transmit_and_clear_counts'
  get 'display_camera_screen' => 'dashboard#display_camera_screen'
  get 'display_current_image_classification' => 'dashboard#display_current_image_classification'
end

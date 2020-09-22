Rails.application.routes.draw do
  root 'static_pages#top'
  get '/signup', to: 'users#new'

  # LINE Messaging API機能
  post '/callback' => 'linebot#callback'

  # ログイン機能
  get   '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month'
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month'
      # tutorが授業可能時間を編集・保存するルーティング
      get 'attendances/edit_one_day'           #/users/:id/attendances/edit_one_day(.:format)	   attendances_edit_one_day_user_path
      patch 'attendances/update_one_day'       #/users/:id/attendances/update_one_day(.:format)  attendances_update_one_day_user_path
      # parentが授業予約申請を編集するルーティング
      get 'attendances/edit_reservation'           #/users/:id/attendances/edit_reservation(.:format)	   attendances_edit_reservation_user_path
      # parentが授業予約申請を確認するルーティング
      get 'attendances/confirm_reservation'           #/users/:id/attendances/confirm_reservation(.:format)	   attendances_confirm_reservation_user_path
      # parentがした授業予約申請を保存するルーティング
      patch 'attendances/update_reservation'       #/users/:id/attendances/update_reservation(.:format)  attendances_update_reservation_user_path

    end
    resources :attendances, only: :update
  end
  
end

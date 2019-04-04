Rails.application.routes.draw do


  scope module: :booking do
    controller :time do
      get 'repeat_form', action: 'repeat_form'
      get :calendar
    end
    scope ':plan_type/:plan_id' do
      resources :time_plans
    end
    scope ':booker_type/:booker_id' do
      resources :time_bookings
    end
    resources :time_items, only: [:index] do
      collection do
        get :select
        get :add_event
      end
    end
  end

  scope :admin, module: 'booking/admin', as: :admin do
    resources :time_lists do
      resources :time_items
    end
    resources :rooms
  end


end

Rails.application.routes.draw do
  mount Manageiq::BishopNew::Engine => "/manageiq-bishop_new"
end

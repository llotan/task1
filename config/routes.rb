Rails.application.routes.draw do
  get 'weather/citis'

  root 'weather#citis'
end

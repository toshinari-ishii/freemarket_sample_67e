Rails.application.routes.draw do
  root to: 'gets#index'
  resouces :gets :only[:new, :show]
end

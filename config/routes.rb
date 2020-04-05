Jets.application.routes.draw do
  root "jets/public#show"

  namespace :api do

    # ===== OSRM Routes Service =====
    namespace :routes do
      get  "gen_route", to: "routes#gen_route"
    end

  end



  any "*catchall", to: "jets/public#show"
end

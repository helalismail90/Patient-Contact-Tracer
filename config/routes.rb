Jets.application.routes.draw do
  root "jets/public#show"

  namespace :api do

    # ===== OSRM Routes Service =====
    namespace :routes do
      get  "gen_route", to: "routes#gen_route"
      get  "gen_trace", to: "routes#gen_trace"

    end

  end



  any "*catchall", to: "jets/public#show"
end

Jets.application.routes.draw do
  root "jets/public#show"

  namespace :api do

    # ===== OSRM Routes Service =====
    namespace :routes do
      get  "gen_trace", to: "routes#gen_trace"
      get  "gen_trace_to_file", to: "routes#gen_trace_to_file"

    end

  end



  any "*catchall", to: "jets/public#show"
end

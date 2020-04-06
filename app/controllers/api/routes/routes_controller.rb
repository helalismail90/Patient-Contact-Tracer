class Api::Routes::RoutesController < Api::AbstractApiController



  def gen_trace
    response = get_route(params[:locations])
    File.open("public/layers/#{Time.now}.json","w") do |f|
      f.write(response.to_json)
    end
    render json: response
  end


  private

  def get_route(locations)
    requestURL = "http://router.project-osrm.org/route/v1/driving/#{locations}?overview=full&geometries=geojson"
    response = HTTParty.get(requestURL)
    return get_geojson(JSON.parse(response.body))
  end

  def get_geojson(osrm_json_response)
    geojson = {"type": "FeatureCollection"}
    features = {"type": "Feature", "properties": { "vendor": "A" } }
    geometry = osrm_json_response["routes"][0]["geometry"]
    features["geometry"] = geometry
    geojson['features'] = [features]
    return geojson
  end



end

class Api::Routes::RoutesController < Api::AbstractApiController



  def gen_trace
    response = get_route(params[:locations])
    write_to_file("/layers/#{Time.now}.json", response.to_json)
    render json: response
  end

  def gen_trace_to_file
    response = get_route(params[:locations])
    path = write_to_file("/layers/#{Time.now}.json", response.to_json)
    redirect_to path
  end


  private

  def write_to_file(filePath, content)
    File.open("public/#{filePath}","w") do |f|
      f.write(content)
    end
    return "#{filePath}"
  end

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

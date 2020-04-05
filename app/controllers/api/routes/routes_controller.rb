class Api::Routes::RoutesController < Api::AbstractApiController

  def gen_route
    pointA = {latitude:'31.27176', longitude:'30.00678'}
    pointB = {latitude:'31.215639', longitude: '29.923051'}
    response = get_route(pointA, pointB)

    render json: response

  end


  private

  def get_route(pointA, pointB)
    requestURL = "http://router.project-osrm.org/route/v1/driving/#{pointA[:latitude]},#{pointA[:longitude]};#{pointB[:latitude]},#{pointB[:longitude]};#{pointA[:latitude]},#{pointA[:longitude]}?overview=full&geometries=geojson"
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

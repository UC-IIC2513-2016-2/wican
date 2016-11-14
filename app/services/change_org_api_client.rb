class ChangeOrgApiClient

  BASE_API_URL = 'https://api.change.org/v1'
  API_KEY = 'b27e8ed5011664c2bcdc5d9f26010b13d65f4c549310d98c0c9dc6ac18a5c120'

  def initialize(organization_id)
    @organization_id = organization_id
  end

  ##
  # Obtiene las peticiones de la institución actual.
  # Si ocurre algún error (ya sea en el request o al parsear la respuesta) retorna un arreglo vacío.
  def get_petitions
    # si no es una respuesta HTTP exitosa (status 2xx) RestClient lanzará una excepción
    response = RestClient.get(build_path("/organizations/#{@organization_id}/petitions"), build_params)
    json_data = JSON.parse(response.body)
    json_data['petitions'].map do |petition|
      petition.slice('title', 'url')
    end
  rescue
    []
  end

  private

  def build_path(path)
    "#{BASE_API_URL}#{path}"
  end

  def build_params(params = {})
    { params: { api_key: API_KEY }.merge(params) }
  end
end

class RequestSenderService
  HOST_URL    = 'http://localhost:9393'
  ENDPOINT    = '/api/v1/room'
  AUTH_SECRET = 'Aditya999'

  def self.deliver(transformed_params)
    uri = build_uri_object
    send_request(uri, build_request_with_authorization_header(uri, transformed_params))
  end

  def self.build_request_with_authorization_header(uri, payload)
    request = Net::HTTP::Post.new(uri.path, { 'Authorization' => AUTH_SECRET })
    request.body = URI::encode_www_form(payload)
    request
  end

  def self.build_uri_object
    URI.parse("#{ HOST_URL }#{ ENDPOINT }")
  end

  def self.send_request(uri, request)
    http = Net::HTTP.new(uri.host, uri.port)
    http.request(request)
  end

  private_class_method :build_request_with_authorization_header, :build_uri_object, :send_request
end
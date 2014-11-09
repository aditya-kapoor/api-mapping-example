require_relative './services/param_transformation_service'
require_relative './services/request_sender_service'

class ParamsParser
  class EmptyParamsError < StandardError; end

  def self.transform_and_send_request(incoming_params={})
    raise EmptyParamsError if incoming_params.empty?
    transformed_params = ParamTransformationService.transform(incoming_params)
    RequestSenderService.deliver(transformed_params)
  end
end
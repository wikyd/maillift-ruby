module MailLift::API
  class LetterStatusAPI

    def initialize(parent_resource, base_resource = nil)
      @resource = parent_resource['letter']['status']
      @base_resource = base_resource
    end

    def list(uuid)
      # clean up options
      items = handle_response(@resource[uuid].get)
      items.map { |i| MailLift::LetterStatus.parse(i, @base_resource) }
    end

    private
    def handle_response(response)
      # TODO test for error / success
      JSON.parse(response.body)
    end

  end
end


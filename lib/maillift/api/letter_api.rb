module MailLift::API
  class LetterAPI

    def initialize(parent_resource)
      @resource = parent_resource['letter']
    end

    def list(options = {})
      # clean up options
      items = handle_response(@resource.get)
      items.map { |i| MailLift::Letter.parse(i) }
    end

    def send(attributes = {}, &block)
      letter = MailLift::Letter.new(attributes)
      yield letter if block_given?
      # Should probably be POST, actually
      result = handle_response(@resource.post(letter.to_api_params))
      MailLift::Letter.parse(result)
    end

    def find(uuid)
      result = handle_response(@resource[uuid].get)
      MailLift::Letter.parse(result)
    end

    def modify(uuid, attributes_to_modify)
      result = handle_response(@resource[uuid].put attributes_to_modify)
      MailLift::Letter.parse(result)
    end

    def delete(uuid)
      handle_response(@resource[uuid].delete)
    end

    private
    def handle_response(response)
      # TODO test for error / success
      JSON.parse(response.body)
    end

  end
end

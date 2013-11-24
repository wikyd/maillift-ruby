module MailLift::API
  class LetterAPI

    def initialize(parent_resource, base_resource = nil)
      @resource = parent_resource['letter']
      @base_resource = base_resource
    end

    # Can take a raw create_date filter string like: >=yyyy-mm-dd
    # Can also take optional start_date, end_date options and munge them
    # into the correct format.
    def list(options = {})
      # clean up options
      options = MailLift::Util.convert_to_maillift(convert_list_options(options))
      response = @resource["?#{RestClient::Payload.generate(options)}"].get
      items = handle_response(response)
      items.map { |i| MailLift::Letter.parse(i, @base_resource) }
    end

    def send(attributes = {}, &block)
      letter = MailLift::Letter.new(attributes)
      yield letter if block_given?
      # Should probably be POST, actually
      result = handle_response(@resource.post(letter.to_api_params))
      MailLift::Letter.parse(result, @base_resource)
    end

    def find(uuid)
      result = handle_response(@resource[uuid].get)
      MailLift::Letter.parse(result, @base_resource)
    end

    def modify(uuid, attributes_to_modify)
      result = handle_response(@resource[uuid].put attributes_to_modify)
      MailLift::Letter.parse(result, @base_resource)
    end

    def delete(uuid)
      handle_response(@resource[uuid].delete)
    end

    private
    def handle_response(response)
      # TODO test for error / success
      JSON.parse(response.body)
    end

    def convert_list_options(options)
      start_date, end_date = options.delete(:start_date), options.delete(:end_date)
      return options unless start_date || end_date

      if start_date == end_date
        options[:creation_date] = "=#{start_date.to_s}"
      elsif start_date && end_date
        options[:creation_date] = "<=#{end_date.to_s},>=#{start_date.to_s}"
      elsif end_date
        options[:creation_date] = "<=#{end_date.to_s}"
      else
        options[:creation_date] = ">=#{start_date.to_s}"
      end

      options
    end

  end
end

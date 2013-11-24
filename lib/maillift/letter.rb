module MailLift
  class Letter < Resource
    MODIFIABLE_PARAMS = [:message_body, :scheduled_delivery, :approval_required]

    def delete
      API::LetterAPI.new(base_resource, base_resource).delete(self.uuid)
    end

    def modify
      api = API::LetterAPI.new(base_resource, base_resource)
      updated_model = api.modify(self.uuid, self.to_modifiable_params)
      self.merge(updated_model)
    end

    def letter_statuses
      API::LetterStatusAPI.new(base_resource, base_resource).list(self.uuid)
    end

    def to_modifiable_params
      params = self.to_h.select { |key, value| MODIFIABLE_PARAMS.include?(key) }
      Util.convert_to_maillift(params)
    end

  end
end

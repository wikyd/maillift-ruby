module MailLift
  class Letter < OpenStruct
    MODIFIABLE_PARAMS = [:message_body, :scheduled_delivery, :approval_required]

    def self.parse(maillift_format)
      new(Util.convert_from_maillift(maillift_format))
    end

    #def delete
      #Letter.delete(self.uuid)
    #end

    #def modify(attributes_to_change)

    #end

    #def letter_statuses
      #LetterStatus.list(uuid)
    #end

    def to_modifiable_params
      Util.convert_to_maillift(self.to_h.slice(MODIFIABLE_PARAMS))
    end

    def to_api_params
      Util.convert_to_maillift(self.to_h)
    end

  end
end

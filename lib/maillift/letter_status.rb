module MailLift
  class LetterStatus < OpenStruct

    def self.parse(maillift_format)
      new(Util.convert_from_maillift(maillift_format))
    end

    #def self.list(letter_uuid)

    #end

    def to_modifiable_params
      Util.convert_to_maillift(self.to_h.slice(MODIFIABLE_PARAMS))
    end

    def to_maillift_params
      Util.convert_to_maillift(self.to_h)
    end

  end
end

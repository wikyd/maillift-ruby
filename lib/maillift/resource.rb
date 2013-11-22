module MailLift
  class Resource < OpenStruct

    def self.parse(maillift_format)
      new(Util.convert_from_maillift(maillift_format))
    end

    def to_api_params
      Util.convert_to_maillift(self.to_h)
    end

  end
end


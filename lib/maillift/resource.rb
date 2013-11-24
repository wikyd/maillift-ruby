module MailLift
  class Resource < OpenStruct

    attr_accessor :base_resource

    def self.parse(maillift_format, base_resource = nil)
      new(Util.convert_from_maillift(maillift_format)).tap do |resource|
        resource.base_resource = base_resource
      end
    end

    def merge(new_resource)
      new_resource.to_h.each do |member, value|
        self[member] = value
      end
    end

    def to_api_params
      Util.convert_to_maillift(self.to_h)
    end
  end
end


module MailLift
  module Util
    # Essentially camelize, but don't need to worry about modules
    def self.convert_attr_to_maillift(name)
      name.to_s.gsub(/(?:_|^)([a-z\d]*)/) { "#{$1.capitalize}#{($2 || '').capitalize}" }
    end

    # Essentially underscoreize, but don't need to worry about modules
    def self.convert_attr_from_maillift(name)
      name.to_s.gsub(/([^A-Z])([A-Z])/,'\1_\2').downcase
    end

    def self.convert_to_maillift(hash)
      new_hash = {} 
      hash.map do |k,v|
        new_hash[self.convert_attr_to_maillift(k)] = v
      end
      new_hash
    end

    def self.convert_from_maillift(hash)
      new_hash = {} 
      hash.map do |k,v|
        new_hash[self.convert_attr_from_maillift(k)] = v
      end
      new_hash
    end
  end
end

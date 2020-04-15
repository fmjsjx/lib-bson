require 'bson'

module BSON

  # Injects behaviour for BSON::Document.
  #
  # @since 1.0.0
  class Document

    # Retrieves the value object corresponding to the each key objects repeatedly.
    # Will normalize symbol keys into strings.
    # Will returns &block.call if the returned value is nil
    #
    # @since 1.0.0
    def dig_or_get(*args, &block)
      value = self.dig *args
      if value.nil? && !block.nil?
        value = block.call
      end
      value
    end

    # Get embedded value.
    #
    # @since 1.0.0
    def get_embedded(path, *args, &block)
      keys = path.split '.'
      value = self
      keys.each do |key|
        if value.is_a? BSON::Document
          value = value[key]
        elsif value.is_a? Array
          if /^\d+$/.match key
            value = value[key.to_i]
          else
            return block.nil? ? (args.empty? ? nil : args.first) : block.call
          end
        else
          return block.nil? ? (args.empty? ? nil : args.first) : block.call
        end
      end
      if value.nil?
        return block.nil? ? (args.empty? ? nil : args.first) : block.call
      end
      return value
    end

  end

end

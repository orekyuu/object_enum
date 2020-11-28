module ObjectEnum
  module EnumClassMethods
    # Get all values.
    # @return [Array] All enum values
    def all
      self.constants(false)
        .map { |c| const_get(c) }
        .filter { |obj| obj.class.ancestors.include? enum_class }
    end

    # Returns the class that represents the value of the Enum.
    # @return [Class] class object
    def enum_class
      self
    end

    # Returns a value that matches Hash.
    # If there is no match, nil is returned.
    # @param [Hash] attributes conditions
    # @return Enum value or nil
    # @raise [ArgumentError] If not implement each_pair method
    def find(attributes = {})
      filter(attributes).first
    end

    # Returns a value that matches Hash.
    # @param [Hash] attributes conditions
    # @return [Array] All values that match the condition
    # @raise [ArgumentError] If not implement each_pair method
    def filter(attributes = {})
      unless attributes.respond_to? :each_pair
        raise ArgumentError, "You must pass a hash. But #{attributes.class} passed."
      end

      all.filter { |enum_value| match_all_attributes?(enum_value, attributes) }
    end

    private

    def match_all_attributes?(enum_value, attributes = {})
      attributes.each_pair do |key, value|
        return false if enum_value.send(key.to_sym) != value
      end

      true
    end
  end
end

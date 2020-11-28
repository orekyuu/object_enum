require_relative "./extended_enum/base"
require_relative "./extended_enum/type_a"
require_relative "./extended_enum/type_b"

class ExtendedEnum
  include ObjectEnum

  EXTENDED_TYPE_A = TypeA.new
  EXTENDED_TYPE_B = TypeB.new

  def self.enum_class
    ExtendedEnum::Base
  end
end

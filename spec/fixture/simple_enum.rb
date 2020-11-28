class SimpleEnum
  include ObjectEnum

  attr_reader :key
  def initialize(key)
    @key = key
  end

  TYPE_A = new(:type_a)
  TYPE_B = new(:type_b)
end

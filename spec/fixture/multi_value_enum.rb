class MultiValueEnum
  include ObjectEnum

  attr_reader :first, :second, :third
  def initialize(first, second, third)
    @first = first
    @second = second
    @third = third
  end

  HOGE = new(:hoge, 1, true)
  FUGA = new(:fuga, 2, true)
  PIYO = new(:piyo, 3, false)
end

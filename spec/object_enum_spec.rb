RSpec.describe ObjectEnum do
  describe ".all" do
    shared_context "all" do |klass, result|
      subject { klass.all }
      it("#{klass}.all") { is_expected.to contain_exactly *result }
    end

    it_behaves_like "all", SimpleEnum, [SimpleEnum::TYPE_A, SimpleEnum::TYPE_B]
    it_behaves_like "all", ExtendedEnum, [ExtendedEnum::EXTENDED_TYPE_A, ExtendedEnum::EXTENDED_TYPE_B]
    it_behaves_like "all", MultiValueEnum, [MultiValueEnum::HOGE, MultiValueEnum::FUGA, MultiValueEnum::PIYO]
  end

  describe ".find" do
    shared_context "find" do |klass, args, result|
      subject { klass.find(args) }
      it("#{klass}.find(#{args})") { is_expected.to eq result }
    end
    it_behaves_like "find", SimpleEnum, { key: :type_a }, SimpleEnum::TYPE_A
    it_behaves_like "find", SimpleEnum, { key: :invalid }, nil
    it_behaves_like "find", ExtendedEnum, { key: :type_a }, ExtendedEnum::EXTENDED_TYPE_A
    it_behaves_like "find", ExtendedEnum, { key: :invalid }, nil
    it_behaves_like "find", MultiValueEnum, { first: :hoge }, MultiValueEnum::HOGE
    it_behaves_like "find", MultiValueEnum, { first: :fuga, second: 2 }, MultiValueEnum::FUGA
    it_behaves_like "find", MultiValueEnum, { first: :fuga, second: 1 }, nil
  end

  describe ".filter" do
    shared_context "filter" do |klass, args, result|
      subject { klass.filter(args) }
      it("#{klass}.filter(#{args})") { is_expected.to contain_exactly *result }
    end

    it_behaves_like "filter", SimpleEnum, { key: :type_a }, [SimpleEnum::TYPE_A]
    it_behaves_like "filter", SimpleEnum, { key: :invalid }, []
    it_behaves_like "filter", ExtendedEnum, { key: :type_a }, [ExtendedEnum::EXTENDED_TYPE_A]
    it_behaves_like "filter", MultiValueEnum, { third: true }, [MultiValueEnum::HOGE, MultiValueEnum::FUGA]
    it_behaves_like "filter", MultiValueEnum, { first: :fuga, second: 1 }, []
  end
end

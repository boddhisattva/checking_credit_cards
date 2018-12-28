describe CardValidators::Type do
  before(:each) do
    described_class.instance_variable_set(:@card_types, nil)
  end

  after(:all) do
    described_class.instance_variable_set(:@card_types, nil)
  end

  describe '#initialize' do
    context 'set of card types is empty' do
      it 'raises an empty file related error' do
        stub_const("CardValidators::Type::CARD_TYPES_INFO", nil)

        expect { CardValidators::Type.new('6014355526000020') }.to raise_error(EmptyFileError, empty_card_types_info_file_error_messgage)
      end
    end

    context 'card types information is not empty' do
      it 'sets the card_types class variable with appropriate Card Type related values' do
        card_validator_type = CardValidators::Type.new('6014355526000020')

        expect(card_validator_type.class.card_types.first).to be_an_instance_of(CardType)
      end
    end
  end

  describe '.add_types' do
    context 'given card types related information' do
      it 'allows you to define dynamic card method types on them based on the provided card types information' do
        card_validator_type = CardValidators::Type.new('4408041234567893')

        CardValidators::Type.add_types

        expect(card_validator_type.visa?).to be true
        expect(card_validator_type.amex?).to be false
      end
    end
  end

  describe '#validate' do
    context 'given card types related information and a card number' do
      it 'returns a card name for a card number matching a particular card type' do
        card_type_validator = CardValidators::Type.new('4408041234567893')

        expect(card_type_validator.validate).to eq "Visa"
      end
    end
  end

  private

    def empty_card_types_info_file_error_messgage
      <<~EMPTY_CARD_TYPE_INFO_FILE_ERROR_MESSAGE
        Information with regard to various card types needs to be specified as part of 'data/card_types_info.yaml'
        This file cannot be empty
      EMPTY_CARD_TYPE_INFO_FILE_ERROR_MESSAGE
    end
end
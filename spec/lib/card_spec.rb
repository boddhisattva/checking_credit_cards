# frozen_string_literal: true

require 'yaml'

describe Card do
  before(:each) do
    CardValidators::Type.instance_variable_set(:@card_types, nil)
  end

  after(:all) do
    CardValidators::Type.instance_variable_set(:@card_types, nil)
  end

  describe '#details' do
    context 'given a card number' do
      it 'gets card related details' do
        card = Card.new('4408041234567893')

        expect(card.details).to eq('Visa: 4408041234567893 (valid)')
      end
    end
  end
end

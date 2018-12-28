# frozen_string_literal: true

describe CardValidators::Luhn do
  describe '#validate' do
    context 'given a card number' do
      it 'determines whether or not the card is valid' do
        card = CardValidators::Luhn.new
        card_number = '60141016700078611'
        other_card_number = '6014355529000028'

        expect(card.validate(card_number)).to be true
        expect(card.validate(other_card_number)).to be false
      end
    end
  end
end

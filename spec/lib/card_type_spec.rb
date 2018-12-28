# frozen_string_literal: true

describe CardType do
  describe 'matching_rules' do
    context 'given a card type with related details' do
      it 'gets the rules matching those card details' do
        card_type = CardType.new('Visa', [13, 16], ['4'] )

        expect(card_type.matching_rules).to eq([[13, 16], ['4']])
      end
    end
  end
end

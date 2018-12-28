# frozen_string_literal: true

describe CardInputParser do
  describe '#parse' do
    context 'given user input consisting of card numbers and other irrelevant data' do
      it 'instantiates card objects for valid card numbers and bypasses other irrelevant data' do
        card_input_parser = CardInputParser.new

        allow(card_input_parser).to receive(:gets).and_return(*user_input)

        expect(card_input_parser.parse.count).to eq(2)
      end
    end
  end
end

private

  def user_input
    ["  \n", "  ffdf1343s   \n", '6014 3555 2900 0028', "6014352700000140\n", "quit\n"]
  end

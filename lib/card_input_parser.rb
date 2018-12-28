# frozen_string_literal: true

require_relative '../lib/card'

class CardInputParser
  def parse
    card_numbers = get_card_numbers

    card_numbers.map do |card_number|
      Card.new(card_number)
    end
  end

  private

    def get_card_numbers
      puts get_card_numbers_message

      card_numbers = []

      while line = gets.chomp
        break if line == 'quit'

        line = line.tr(' ', '')

        card_numbers << line if is_not_empty?(line) && has_only_digits?(line)
      end

      card_numbers
    end

    def get_card_numbers_message
      <<~GET_CARD_NUMBERS_MESSAGE
        Please enter the card numbers line by line(one set of numbers per line).
        Type 'quit' on a new line followed by enter once you have finished entering all input.
      GET_CARD_NUMBERS_MESSAGE
    end

    def is_not_empty?(line)
      !line.strip.empty?
    end

    def has_only_digits?(line)
      line.scan(/\D/).empty?
    end
end

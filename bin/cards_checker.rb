# frozen_string_literal: true
require_relative '../lib/card_input_parser'

cards = CardInputParser.new.parse

cards.each do |card|
  puts card.details
end
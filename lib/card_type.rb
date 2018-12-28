# frozen_string_literal: true

class CardType
  attr_reader :name

  def initialize(name, length, prefixes)
    @name = name
    @length = length
    @prefixes = prefixes
  end

  def matching_rules
    [length, prefixes]
  end

  private

    attr_reader :prefixes, :length
end

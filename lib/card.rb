# frozen_string_literal: true

require_relative '../lib/validators/luhn'
require_relative '../lib/validators/card_type_validator'

class Card
  def initialize(number)
    @number = number
  end

  def details
    "#{card_type}: #{number} (#{check_validity})"
  end

  private

    attr_reader :type, :valid, :number

    def card_type
      @type ||= CardValidators::Type.new(number).validate
    end

    def check_validity
      @valid ||= CardValidators::Luhn.new.validate(number)

      validity_status
    end

    def validity_status
      valid == true ? 'valid' : 'invalid'
    end
end

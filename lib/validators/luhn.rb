# frozen_string_literal: true

module CardValidators
  class Luhn
    def validate(card_number)
      reversed_number = card_number.chars.reverse

      result =  reversed_number
                .each_slice(2)
                .inject(0) do |total, (first_digit, second_digit)|
                  doubled_number = second_digit.to_i * 2
                  total + first_digit.to_i + doubled_number.divmod(10).sum
                end

      result % 10 == 0
    end
  end
end

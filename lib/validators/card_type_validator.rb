require 'yaml'

require_relative '../card_type'

class EmptyFileError < StandardError; end

module CardValidators
  class Type
    UNKNOWN_CARD_TYPE = 'Unknown'

    CARD_TYPES_INFO = YAML.load_file(File.join(File.dirname(__FILE__), '../../data', 'card_types_info.yaml'))

    class << self
      attr_accessor :card_types
    end

    def initialize(card_number)
      @card_number = card_number
      load_card_types
    end

    def self.add_types
      card_types.each do |card_type|
        card_type_name = card_type.name
        define_method "#{card_type_name.downcase.tr(" ", "_")}?" do
          identified_card_type_name = validate
          identified_card_type_name == card_type_name
        end
      end
    end

    def validate
      matching_card_type = load_card_types.detect do |card_type|
        card_type_length, card_type_starts_with = card_type.matching_rules
        card_regex_pattern = Regexp.new("^((#{card_type_starts_with.join(')|(')}))")

        card_type_length.include?(card_number.size) && card_number.match?(card_regex_pattern)
      end

      matching_card_type ? matching_card_type.name : UNKNOWN_CARD_TYPE
    end

    private
      attr_reader :card_number

      def load_card_types
        self.class.card_types ||= initialize_card_types
      end

      def initialize_card_types
        unless CARD_TYPES_INFO
          raise EmptyFileError, empty_card_types_info_file_error_message
        end

        CARD_TYPES_INFO.map do |_key, value|
          CardType.new(value[:name], value[:rules][:length], value[:rules][:prefixes])
        end
      end

      def empty_card_types_info_file_error_message
        <<~EMPTY_CARD_TYPE_INFO_FILE_ERROR_MESSAGE
          Information with regard to various card types needs to be specified as part of 'data/card_types_info.yaml'
          This file cannot be empty
        EMPTY_CARD_TYPE_INFO_FILE_ERROR_MESSAGE
      end
  end
end

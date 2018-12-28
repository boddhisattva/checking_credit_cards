# Checking Cards

## About

This is a program used to identify different Checking Cards

## Code Related Design Decisions

* The entities related to the problem domain are `Card` and `CardType`

* The name and the rules that define each card type is maintained as part of
`data/card_info_types.yaml`. One of the main reasons behind maintaining the card types information as part of the `yaml` file is that if we'd want to add one or more card types, we just need to specify the length, the starting digits corresponding to each of those card types along with the card name. This way we don't have to change the code whenever we add or remove new card types that have similar rules that define them.

* Have made use of a `CardInputParser` to take one or more card numbers related user input. The `CardInputParser` also appropriately handles irrelevant data like alphanumeric strings, extra whitespaces etc.,

* The algorithm that's used to identify whether or not a given card is valid is the Luhn Algorithm, hence created a validator with class name `Luhn`.

### Assumptions
* The data that would be entered in the `data/card_types_info.yaml` file to accommodate new card types would follow the existing format to define each card type

## Usage

### Dependencies
* Ruby 2.5.1
* Please refer to the Gemfile for the other dependencies

### Setup
* Run `bundle` from a project's root directory to install the related dependencies.

### Running the program
One can run the program with the below command from the projects root directory.

*Format:*

`ruby bin/cards_checker.rb`

### Running the tests
* One can run the specs from the project's root directory with the command `rspec`

### Program Output

* Below is a sample program output run against the command `ruby bin/cards_checker.rb`

```
Please enter the card numbers line by line(one set of numbers per line).
Type 'quit' on a new line followed by enter once you have finished entering all input.
4408 0412 3456 7893
6011412312345612
3441 2134 5123 123
5112 4123 1234 4231
1234 1234 5123 1234
quit
Visa: 4408041234567893 (valid)
Discover: 6011412312345612 (invalid)
AMEX: 344121345123123 (invalid)
MasterCard: 5112412312344231 (invalid)
Unknown: 1234123451231234 (invalid)
```

### Check the card type for a given card number
* This works based on predefined card types specified in `data/card_types_info.yml`
* Open `irb` from the root directory of your project
* Once in `irb` type the below commands to try executing the project:
```

2.5.1 :001 > require_relative 'lib/validators/card_type_validator'
 => true
2.5.1 :002 > card_validator_type = CardValidators::Type.new('6011412312345612')
 => #<CardValidators::Type:0x00007fea249853a8 @card_number="6011412312345612">
2.5.1 :003 > CardValidators::Type.add_types
 => [#<CardType:0x00007fea24985240 @name="AMEX", @length=[15], @prefixes=["34", "37"]>, #<CardType:0x00007fea249851c8 @name="Discover", @length=[16], @prefixes=["6011"]>, #<CardType:0x00007fea24985060 @name="MasterCard", @length=[16], @prefixes=["51", "52", "53", "54", "55"]>, #<CardType:0x00007fea24985038 @name="Visa", @length=[13, 16], @prefixes=["4"]>]
2.5.1 :004 > card_validator_type.visa?
 => false
2.5.1 :005 > card_validator_type.discover?
 => true

 ```
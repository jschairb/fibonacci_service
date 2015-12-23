module FibonacciService
  class Sequence
    attr_accessor :size

    def initialize(size)
      validate_number_is_integer(size)
      validate_number_is_positive(size)
      validate_number_is_not_zero(size)
      @size = size.to_i
    end

    # Using the previously calculated numbers to get the next number is a significant
    # performance increase. For example, on my laptop, generating 35 numbers takes
    # > 3 seconds to complete, while the caching version can easily calculate 500
    # numbers in less than 3/10ths of a second.
    def cached_fibonacci(number, collection)
      case number
      when 0
        0
      when 1
        1
      when 2
        1
      else
        previous_number = collection.fetch(-2, 0)
        current_number  = collection.fetch(-1, 1)
        previous_number + current_number
      end
    end

    # The canonical implementation of a Fibonacci sequence uses recursion to calculate
    # each individual number as it gets added to a collection, it can be expressed
    # something like Fib(10) = 55. The requirements for this application are returning
    # the full sequence of numbers, so we can skip re-calculating each number by
    # using the previously calculated numbers in the collection. See #cached_fibonacci
    # for the implementation.
    #
    # The collection argument is added here to keep the same interface between the
    # canonical implementation and the cached version.
    def fibonacci(number, collection = nil)
      if number == 0
        0
      elsif number == 1
        1
      elsif number == 2
        1
      else
        fibonacci(number - 1) + fibonacci(number - 2)
      end
    end

    def sequence
      collection = []
      size.times do |n|
        collection << cached_fibonacci(n, collection)
      end
      collection
    end

    private
    def validate_number_is_integer(number)
      raise InvalidNumberError, "number must be an integer" if number.to_i.to_s != number.to_s
    end

    def validate_number_is_not_zero(number)
      raise InvalidNumberError, "number must not be 0" if !number.to_i.nonzero?
    end

    def validate_number_is_positive(number)
      raise InvalidNumberError, "number must be positive" if number.to_i.abs != number.to_i
    end
  end
end

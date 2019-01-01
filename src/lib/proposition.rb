class Proposition
  attr_accessor :sentence, :variables

  def initialize(sentence)
    @sentence = sentence

    @sentence.define_singleton_method(:words) do
      split(/\W+/)
    end

    @sentence.define_singleton_method(:operands) do
      split(/\s|\w|\s/).reject(&:empty?)
    end
  end

  def parse
    @variables = sentence.words.uniq
  end

  def evaluate
    variables.each do |var|
      define_singleton_method(var) do
        true
      end
    end

    eval("lambda { " + sentence + " } ").call
  end

  def amount_of_variables
    2 ** variables.length
  end
end
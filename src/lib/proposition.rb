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

  def amount_of_variables
    2 ** variables.length
  end
end
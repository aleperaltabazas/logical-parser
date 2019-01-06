require_relative 'proposition'

module LogicEvaluation
  def logic_value
    prop = Proposition.new(self)
    prop.parse

    prop.evaluate
  end
end

class String
  include LogicEvaluation
end
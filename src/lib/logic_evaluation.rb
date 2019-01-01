module LogicEvaluation
  def logic_value
    eval('lambda { ' + self + ' } ').call
  end
end

class String
  include LogicEvaluation
end
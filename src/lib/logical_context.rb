class LogicalContext
  def define_premise(premise, value)
    define_singleton_method(premise.to_s) do
      value
    end
  end

  def truth_value(sentence)
    eval('lambda { ' + sentence + ' } ').call
  end
end
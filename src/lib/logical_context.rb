class LogicalContext
  def define_premise(premise, value)
    define_singleton_method(premise) do
      value
    end
  end

  def truth_value(sentence)
    eval('lambda { ' + sentence + ' } ').call
  end
end
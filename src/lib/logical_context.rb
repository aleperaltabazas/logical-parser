require_relative '../lib/boolean'

class LogicalContext
  def connectors
    %i[and or xor then if_and_only_if not]
  end

  def define_premise(premise, value)
    define_singleton_method(premise) do
      value
    end
  end

  def truth_value(sentence)
    eval('lambda { ' + sentence + ' } ').call
  end

  def >(a, b)
    a.then b
  end

  def <=>(a, b)
    a.if_and_only_if b
  end

  def !=(a, b)
    a.xor b
  end
end
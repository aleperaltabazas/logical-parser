module Boolean
  def and(other)
    self && other
  end

  def or(other)
    self || other
  end

  def xor(other)
    (self && !other) || (other && !self)
  end

  def then(other)
    !self || other
  end

  def if_and_only_if(other)
    self.then(other) && other.then(self)
  end

  def not(expression = nil)
    if expression.nil?
      !self
    else
      !expression
    end
  end

  alias > :then
  alias <=> if_and_only_if
  alias != xor
end

class TrueClass
  include Boolean
end

class FalseClass
  include Boolean
end
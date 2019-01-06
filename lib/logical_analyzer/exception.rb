class Contingency < Exception
  def initialize(msg = 'Proposition might not always be false or always true under any circumstance')
    super(msg)
  end
end
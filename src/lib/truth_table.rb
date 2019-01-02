class TruthTable
  attr_accessor :variables, :iterations, :table

  def initialize(variables)
    @variables = variables
    @iterations = 2 ** variables.size
    @table = []
  end

  def generate_table
    for iteration in 0...iterations
      row = []

      for column in (variables.size - 1).downto 0
        value = (iteration / 2 ** column).odd?
        row.append(value)
      end

      @table.append(row)
    end

    @table
  end

  def truth_value_of(variable, row)
    column = variables.find_index(variable)
    table[column][row]
  end
end
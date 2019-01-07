# Propositional Logic Analyzer

As it names indicates, this library is a simple propositional logic analyzer, returning the truth value of a proposition by generating its truth table. If the table generated results in either a tautology or a contradiction, returns true or false accordingly; on case of a contingency, raises Contingency.

## Installation

You'll need the gem for the project, which can be installed by running

```
sudo gem install logic_analyzer
```

After that, just include the gem in your Gemfile.
```
gem 'logic_analyzer'
```

## How to use

To evaluate a proposition, you'll first need to create a ```LogicalAnalyzer```. It can be created with any number or arguments; each argument should be a string that corresponds to a propositional structure (example further below). The analyzer can then add more premises, and if wanted a conclusion. Once you have your proposition correctly created, send ```parse``` to the analyzer, and then ```èvaluate```.

```ruby
analyzer = LogicAnalyzer.new('p then q')
analyzer.add_sentence('p')
analyzer.add_conclusion('q')

analyzer.parse
=> '((p then q) and (p)) then (q)'

analyzer.evaluate
=> true
```

Note that between parsing and evaluating you can still add more premises or change the conclusion, but it's neccessary for it to be parsed once again.

As I already stated, if no true or false result can be determined, the analyzer will raise Contingency.
```ruby
analyzer = LogicAnalyzer.new('p and q')

analyzer.parse
=> '(p and q)'

analyzer.evaluate
Contingency: Proposition might not always be false or always true under any circumstance
```

So, now the only thing left is how should you type the propositions for the analyzer to parse it correctly. Each word (yes, they should be *words*, only alphabetical characters) should be separated by a space, as they'll be recognized each as a different variable. Be warned that if you includ some non-alphabetical character (such as dot '.'), the variable will be split by said character, resulting in a (most possibly) wrong evaluation. Other than that, feel free to use any word! 
Finally, variables should then be connected by the following logical connectors.
* ```and```|```&&```: logical conjunction
* ```or```|```||```: logical disjunction
* ```xor```|```!=```: exclusive disjunction
* ```then```: conditional
* ```only_if```: biconditional/logical equivalence

Parentheses can also be used accordingly to assign different priorities. ```p and q then p``` will be parsed as ```p and (q then p)``` resulting in a contingency; whereas ```(p and q) then p``` will result in a tautology.


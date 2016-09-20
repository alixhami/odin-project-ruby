## Object-Oriented Programming

### *Classes and Methods*

+ What is an implicit return?
  + Ruby automatically returns the last thing it processes, so you can just type the thing you want to return at the end without literally typing `return` before it
+ What is a class?
  + A blueprint from which individual objects are created
+ When should you use a class?
  + Create a class when you need to create multiple objects with the same methods and/or characteristics
+ How do you create a class in your script file?
  + `class Viking ... end`
+ What is an instance of a class?
  + One of the objects in your class
  + e.g., the viking named "Erlich" in your Viking class
+ What is the difference between the CamelCase and snake_case styles of naming?
  + Class names use CamelCase and variables use snake_case
+ How do you instantiate a class?
  + `erlich = Viking.new("Erlich", 30, 250)`
+ How do you set the state of your new instance?
  + Assign it values for the variables that have been set up in the class
  + e.g., name = Erlich, weight = 250 lbs
+ What should be done in the #initialize method?
  + Set the initial variable values for the instance that were given as arguments when the instance was created
+ What is a class method?
  + Methods owned by the class itself
  + There is only one instance of the method
  + e.g., a counter that increments by one every time you make a new Viking
+ How is a class method different from an instance method?
  + It's like Highlander; there can only be one.
+ How are methods you already know like #count or #sort etc instance methods?
  + You refer to them with hashtags #count #yolo
  + Use a dot to use them: `bacon.length`, `erlich.weight`
+ What's the difference between how you declare a class method vs an instance method?
  + Class Method: `def self.class_method` or `def Viking.class_method`
  + Instance Method: `def instance_method`
+ What's the difference between how you call a class method vs an instance method?
  + `Viking.class_method` vs `erlich.instance_method`
+ What is an instance variable?
  + A variable that has a value unique to the instance
  + `@variable_name`
+ What's the difference between an instance variable and a 'regular' variable?
  + When an instance is destroyed, you won't have access to these variables.
+ What are "getter" and "setter" methods used for?
  + A method created specifically to get or set a variable for an instance of a class
+ What is the difference between a "getter" and a "setter" method?
  + A getter is a method used to return information about the object
  + A setter is a method used to update or set information about the object
+ How do you make instance variables readable outside your class? Writeable? Both at the same time?
  + `attr_reader :age` `attr_writer :age` `attr_accessor :age`
+ Can a class call its own class methods?
  + Yup. Just use it inside the definition of the new class method.
+ What's the difference between when you would use a class variable and when you would use a constant?
  + Use a constant when you don't expect that the value will ever change. Use a variable if you think it will.
+ What's the difference between a class and a module?
  + A module is a collection of methods, and does not have the same capabilities as a class.
  + Methods can't be instantiated. There is only one version.
+ When would you use a class but not a module?
  + Instance variables
+ How does inheritance work?
  + The ability of one class to be a child of another class and therefore inherit all its characteristics, including methods and variables
  + `class Viking < Person`
+ Why is inheritance really useful?
  + You don't have to repeat yourself if you want to share methods between classes
+ How do you extend a class? What does that mean?
  + `class Viking < Person` - Viking extends Person
+ What does #super do? Why use it?
  + `#super` lets you call the superclass's version of your current method.
  + Useful when you want to copy only part of a parent's method and change something for the child class

### *Scope*
+ What is scope?
  + When you can access a variable or method and when you can't
+ When can you start using a variable?
  + In any line after it is defined until the current scope ends
+ When is a new scope defined?
  + Whenever a variable is created
+ When are methods in scope?
  + After the Ruby interpreter has defined it
+ What is a private method?
  + Only accessible within the particular scope
  + e.g., You can't call Erlich's `#die` from the command line if it is defined under the word `private`, but the `#health` method might call it if his health goes to zero
+ What is a protected method?
  + A method that has limited scope
+ How are private and protected methods different?
  + `protected` provides most of the privacy of private but lets the methods inside other instances of the same class or its descendents also access it
  + e.g., If you type the word `protected` above the `#attack` method, you can do `erlich.attack(oleg)`, but you can't call it by itself from the command line
+ What does "encapsulation" mean?
  + Instance variables are private and you have to use public getters and setters

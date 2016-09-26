## Files and Serialization

+ What are two ways to store a file from your hard drive into a string or array in your Ruby script?
  + Number 1
  ```Ruby
  file = open("tester.txt", 'r')
  insides = file.read
  ```
  + Number 2
  ```Ruby
  insides = []
  File.open("tester.txt").each do |line|
    insides << line.strip
  end
  ```
+ What are three things made possible or much easier by serialization?
  + Reading a file and recreating it through a script
  + Working with a deep hierarchy of objects
  + Passing data between programs written in different programming languages
+ What is JSON?
  + Javascript Object Notation
  + Syntax for storing and exchanging data
  + Human-readable format that often serves as a configuration format
  + Per Skorks: "A 'low-fat' alternative to XML and can be used to transport data over the wire by AJAX calls that require data from the server"
+ What is YAML?
  + Wikipedia: "Originally YAML was said to mean Yet Another Markup Language, referencing its purpose as a markup language with the yet another construct, but it was then repurposed as YAML Ain't Markup Language, a recursive acronym, to distinguish its purpose as data-oriented, rather than document markup."
  + Structure is shown through indentation (one or more spaces).
  + Sequence items are denoted by a dash, and key value pairs within a map are separated by a colon.
+ How do you turn a Ruby object into JSON?
  ```Ruby
  require 'json'

  class A
    def initialize a=[1,2,3], b='hello'
      @a = a
      @b = b
    end

    def to_json
      {'a' => @a, 'b' => @b}.to_json
    end

    def self.from_json string
      data = JSON.load string
      self.new data['a'], data['b']
    end

  end

  JSON.dump object #returns a JSON string
  JSON.generate object #returns a JSON string
  object.to_json #returns a JSON string
  ```
+ How do you turn JSON into a Ruby object?
  ```Ruby
  JSON.load string #returns an object
  JSON.parse string #returns an object
  object.from_json #returns an object
  ```

#Presentation 1: Elixir

##Information Sources

* [Elixir Web Site](http://elixir-lang.org/)
* [Erlang Web Site](http://http://www.erlang.org/)
* Thomas, Dave. *Programming Elixir.* Pragmatic Bookshelf, 2014.

##What is Elixir?

* A programming language running on the Erlang virtual machine.

##What is Erlang?

* Erlang is a programming language developed by Ericsson in the 1980s.
* Erlang infrastructure developed a reputation for excellent support for concurrency, stability and fault tolerance.
* Elixir is an alternative language to Erlang, but provides access to the same infrastructure.

##Elixir Hello, World

* `IO.puts "Hello, World"`

##Installing and Running Elixir

* On Windows, download and run all-in-one install from (http://elixir-lang.org/install.html#windows).
* To play with Elixir, you can use the Interactive Elixir (iex) command line shell.
* To start iex, type iex from Windows Command Prompt (installer should have added the Elixir folder to the system path).
* Can use `Ctrl + C` to exit iex on Windows.
* iex also provides access to the Elixir API documentation via the `h` command.
    * Typing `h(Enum)` in iex will print the documentation for the Enum module.
* Elixir programs run as scripts typically have a `.exs` extention.
* Elixir programs that are compiled to be run later typically have an `.ex` extension.
* To run an Elixir program from a file, type `elixir hello.exs` from a command prompt in the directory where the file is located.
* Alternatively, type `c "hello.exs"` from iex (running in the directory where hello.exs is located).
* On Mac OSX, Elixir is most easily installed via homebrew.
* Elixir treats any line starting with a `#` as a comment.

##Elixir Language Characteristics

* Elixir is a functional language.
    * No classes.
    * Code is organized into functions which are organized into modules.
    * So you use `String.capitalize "colorado"` to capitalize a string.
        * Not `"colorado".capitalize()` like in an object-oriented language.
        * `capitalize` is a function.
        * `String` is a module that groups related functions.
* Data in Elixir is completely immutable.
    * Data can't be changed once it has been created.
    * So how does `String.capitalize` work if data cannot be changed?
        * Creates and returns a new, capitalized string.
        * All other Elixir functions work the same way.
        
##Elixir Features

###Data Types

* Integers: (e.g. `1234`, `0xfff`, `0b10101`)
* Floats: (e.g. `1.5`, `1.2e-5`)
* Atoms: (e.g. `:red`, `:blue`)
    * Represents the name of something.
    * Used similarly to constant strings or enumerated types in other languages.
* Ranges: (e.g. `1..10`)
* Regular Expressions: (e.g. `~r{[A-Z][a-z]*}i`)
* Also includes types for process ids, ports, and globally unique references.

###Collections

* Tuples: Sequence of values.
    * e.g. `{1, "Colorado"}`
    * Often used to return multiple values from a function call.
        * The atoms `:ok` and `:error` are often returned as the first part of a tuple to serve as a status code.
* Lists: 
    * e.g. `[ 1, 2, 3 ]`
    * Implemented with a linked-list like structure.
        * Sequential access fast, random access slow.
    * Supports operators for concatenation (`++`), set substraction (`--`), and checking membership (`1 in [ 1, 2, 3]`).
    * Can also use keyword list syntax (e.g. `[ artist: "Beatles, The", song: "Eleanor Rigby",  album: "Revolver"]`).
        * Implemented behind the scenes as a list of 2-tuples.
        * Square brackets can be omitted when a list is used as the last argument in a function call.
            * Provides variable-length argument-like functionality.
* Maps: Efficient name-value association.
    * e.g. `%{"U.S. 85" => "Santa Fe Boulevard", "U.S. 287" => "Colfax Avenue"}`
    * Keys and values can be any type.
* Binaries: Allow direct manipulation of binary data.
    * e.g. `<< 1, 2 >>`
    
###Operators

* Supports keywords `true`, `false` and `nil`.
* Comparison Operators
    * `<`, `<=`, `>`, `>=`
* Strict equality (no type conversion): `===`, `!===`
* Non-strict equality: `==`, `!==`
* Boolean operators: `and`, `or`, `not`
    * Arguments must be boolean
* Relaxed boolean operators: `&&`, `||`, `!`
    * Allows any type of arguments.
    * Coerces non-boolean arguments to booleans (like in JavaScript).
* Arithmetic operators: `+`, `-`, `*`, `/`
    * Unlike most languages, `\` performs decimal division and returns a float.
    * Use `div` function to do integer division (equivalent to normal division in most languages).
    * Use `rem` function to return the remainder of a division.

###Functions

* Elixir supports anonymous functions.
    * e.g. `square = fn (num) -> num + num end`
* Elixir has very unusual function call syntax for calling anonymous functions.
    * e.g. `square.(5)`
* Unlike anonymous functions, named functions don't require the dot when called.
* Functions can have multiple bodies.
    * Use pattern matching on the parameter list to choose which body to run.
    * See [functions.exs](src/functions.exs) for an example.
* Elixir supports closures.
    * Functions can refer to variables in their outer scope.
    * Those variables remain available to the function even after they go out of scope.
    * See [functions.exs](src/functions.exs) for an example.
* Note: `functions.exs` contains answers I wrote for exercises in the Thomas book.
    





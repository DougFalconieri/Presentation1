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
* Elixir programs typically have a `.exs` extention.
* To run an Elixir program from a file, type `elixir hello.exs` from a command prompt in the directory where the file is located.
* Alternatively, type `c "hello.exs"` from iex (running in the directory where hello.exs is located).
* On Mac OSX, Elixir is most easily installed via homebrew.

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




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
* Can use `IO.puts` to write string to console.
* Can use `IO.inspect` to write collections to console.

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

* Note: `functions.exs` contains answers I wrote for exercises in the Thomas book.
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
* Elixir also supports shorter syntax for creating a function.
    * `&(&1 + &2)` is equivalent to `fn (n1, n2) -> n1 + n2 end`
    
###Modules and Named Functions

* See `Times` module in [functions.exs](src/functions.exs) for an example of defining a module and named function.
* Note that there is no return keyword.
* Functions can also be defined in a single-line syntax
* A function can be defined multiple times in the same module
    * Pattern matching is used to determine which function is called.
    * See `Sums` module in [functions.exs](src/functions.exs) for an example.
* Pattern matching can be refined with a guard clause using the `when` keyword
    * See Guesser module in [functions.exs](src/functions.exs) for an example.
* Default parameters can be defined for function parameters using `//` operator.
* Private functions can be defined in a module by using `defp` instead of `def`.
* Elixir allows chaining of functions using the `|>` operator.
    * Similar to pipe operator in Linux.
 
###Working with Collections

* No `for` or `while` loop construct in Elixir.
* Need to use recursive algorithms to work with lists
    * See `Lists.mapsum` module in [collections.exs](src/collections.exs) for an example.
* Elixir supports dictionary-like functionality through both maps and HashDict
    * HashDicts are more performant for large amounts of data.
    * Both can be worked with similarly using functions in the `Dict` module.
* Structs are another dictionary-like structure, but keys are limited to atoms.
* Elixir also supports set functionality with the `HashSet`.
   * Can be manipulated with functions in the `Set` modules.
* Elixir comes a large number of functions for working with collections in the `Enum` module.
    * Due to dynamic typing many of these functions work with a variety of collections.
* Elixir also supports Streams which operate on collections in a lazy manner that doesn't create intermediate lists.
    * Useful for dealing with very large lists.
* Elixir supports list comprehensions -- a short syntax for transforming a collection
    * e.g. `for x <- 1..10, rem(x, 2) == 0, do: x * x` returns a list of squares of the even numbers between 1 and 10.
    
###Strings

* Elixir supports two kinds of strings.
    * Double-quoted strings are represented directly as UTF-8 encoded bytes.
    * Single-quoted strings are represented as a list of integer character codes.
* Both types support multi-line strings and escape sequences.
* Both also support embedding Elixir variables.
    * e.g. `IO.puts "Your total is $#{total}"`
* Library functions for working with strings is found in the `String` module.
    * Only works on double-quoted strings.
    
###Control Flow

* Elixir includes several keywords for conditional control flow.
* In idiomatic Elixir, these are rarely used.
    * Pattern matching and guard clauses are preferred.
* `if`:  e.g. `if value > 0, :do "true" ,:else "false"`
* `until`:  works like a reversed `if`.
* Elixir also supports two multiple branch conditionals `case` and `cond`.
    * `case` uses standard Elixir pattern matching.
* Elixir supports throwing exceptions using the `raise` keyword.
    * But they are rarely used. Elixir is focused on recovering from most errors.
    
###Concurrency

* One of Elixir's greatest strengths.
* Elixir uses an actor concurrency model.
* To run a function concurrently, create a new process by passing the function to the `spawn` function.
   * Elixir processes do not map one-to-one to operating system processes - they are much lighter-weight.
   * Accordingly, Elixir programs often spawn many processes.
* `spawn` returns a PID that uniquely identifies the new process.
* The `send` command takes a PID and a message (usually an atom or tuple) and sends it to the PID's process.
* A process can use the `receive` command to handle messages.
    * `receive do
         {:ok, message} -> IO.puts message
       end`
    * a `receive` block only handles a single message. To make it loop and handle multiple messages, use recursion.
    * `receive` blocks can contain an `after` clause to cause to time out after a certain amount of time.
* The `spawn-link` command can be used to create a linked process.
    * The parent process will exit if the linked process exits.
* The `spawn-monitor` command can be used to create a monitored process.
    * The parent process will be informed if the monitored process exits.
* Processes can be assigned to different nodes. Nodes are instances of the Erlang VM.
    * Nodes can potentially be on different computers on a network.
* Distributed applications can make use of OTP -- Erlang's powerful networking platform.
    * Supports advanced features like supervisor processes that can restart failed child processes.
    * Also, supports ability to hot-swap process codes with no downtime.
        * These features are implemented using processes to store and convert process state.
* To create a server process in Elixir, you can add the `GenServer` behavior.
    * Provides callbacks like `handle_call` to recieve data from another process and return a result.
    * `handle_cast` is similar, but does not return a result to the calling process.
* A `Task` is a higher-level construct to create and interact with a separate process.
    * Created by calling `Task.async` and passing a function.
    * Calling `Task.await` will pause the current thread until the `Task` returns a result.
* An `Agent` is a process that runs in the background and maintains a piece of state.
    * `Agent.start` creates and agent and takes a function to run.
    * `Agent.get` and `Agent.update` are used to retrieve and modify the Agent's state respectively.
* `Agents` and `Tasks` can run on a different node from their calling processes.
    * Can serve as simple building blocks for distributed applications.

## An Elixir Adventure

* I always find the best way to learn a language is to try to write a non-trivial program in it.
* So I attempted to write a program that solves the travelling salesman problem in Elixir.
    * Very naive implementation: finds all possible routes and calculate the length of each one to find the shortest.
        * Horrible complexity of O(n<sup>2</sup>2<sup>n</sup>).
    * Good opportunity to use Elixir's concurrency features to do the calculations in parallel.
* Code for the program is in [salesman.exs](src/salesman.exs)
* First needed to generate some locations.
    * A location is a 3-tuple with an identifier, an x-coordinate and a y-coordinate.
    * Found that Elixir uses Erlang's `random.uniform()` function to generate random numbers.
        * Since it is an Erlang function, must be called as `:random.uniform()`.
    * Used `Enum.map` function with a range and `:random.uniform` to create a list of locations.
        * Impressively simple and concise code needed for this task. Only one line!
* Perhaps due to recently writing Python code, I found I always forgot the `end` at the end of functions.
* Next, I needed to find all the possible routes -- the permutations of the locations I generated.
    * Very difficult to think of a recursive solution to this problem.
    * After about thirty minutes of trying and failing to find a solution, I gave up and looked online.
    * Solution turned out to involve a list comprehension combined with recursion.
        * Again, impressively concise...
        * ..but hard to wrap your brain around!
        * Finding these solutions may become easier with more experience with functional programming.
* Felt elegant to use Elixir's chaining syntax to pass the locations from my generation function directly into the permutation function.
* Next step was to compute the length of a route.
    * Considered using `Enum.reduce` which uses a function to collapse a list down to a single value.
    * But didn't seem like it would work since the function only gets passed one list item at a time.
    * Distance formula requires two locations at a time.
    * So wrote a recursion-based list iteration algorithm to compute the length.
        * Required Elixir's pattern-matching functionality to access first two items in the list as well as components of the location tuple.
    * Required functional thinking, but much easier to think through than permute function.
        * Functional programming confidence up!
    * Math functions like powers and square-roots require dipping down into the Erlang math library.
* Once I had a function to compute the length of a route, I use `Enum.map` to apply it to each route.
* I then used `Enum.min_by` to find the shortest route.
* As expected, performance was horrible.
    * Memory usage was especially bad.
    * Running it with more than 10 locations crashed iex.
    * Running it on 100 locations crashed my computer.
* Tried to improve performance by splitting the routes into four partitions and finding the minimum route for each partition in parallel.
    * Chose four partitions because my CPU has four cores.
* Had to look on line to figure out a way to the partitioning.
    * Solution involved using `Enum.split` with recursion and pattern-mapping.
    * Functional programming confidence back down!
* Used `Enum.map` to create a task for each partition.
    * Returned a list of tasks.
* Used `Enum.map` again on the tasks to wait for the results and gather them into a list.
   * Incredibly simple and concise code to do this complicated task!
* Finally, just needed to find which of the partition minimums was the overall minimum.
* Used Erlang's `:timer.tc` function to compare performs of single-threaded and parallel versions.
    * Parallel version was slightly faster for 10 locations. 
    * More than ten locations caused the Elixir environment to run out of memory.
        * Memory situation could possibly be improved using Elixir's `Stream` module.
* Encountered two compiler warnings. 
    * Complains about unused function parameters.
        * Fixed by replacing unused parameter names with underscores.
    * Complains about multiple functions with the same name and number of parameters.
        * Fixed by moving these function definitions next to each other in the source code.
* Mission accomplished!!

## Final Thoughts on Elixir

### What I Liked

* It was fun to think about how to solve problems in a functional way.
* Can result in really concise elegant code.
* Using functional looping helpers like `Enum.map` felt elegant and not hard to get used to.
* Loved the ability to chain functions together like you can in the Unix shell.
* Using `Tasks` makes writing parallel code really simple and easy to understand.
* Erlang Beam VM's advanced process management is really powerful.

### Possible Downsides

* Syntax uses a lot of punctuation symbols so it doesn't read like English and can be hard to parse.
    * Perl was criticized a lot for this.
* For complicated cases where built-in functions like `Enum.map` doesn't work, you need to write your own functional iteration code using recursive calls.
    * These can be very hard to get your head around.
    * Hard to see "average" developers in industry writing this kind of code.
* Elixir sometimes shows its young age.
   * Need to call Erlang functions for a lot of functionality which creates a bigger learning curve and uglier syntax.
   * Map implementations still seem to be a work in progress with several confusing alteranatives.
   
### Overall, it was really fun to play with Elixir and I am looking forward to doing more functional programming in the future!
    
    





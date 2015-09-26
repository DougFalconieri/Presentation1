# Multi-body function example
fizz_buzz = fn 
    (0, 0, c) -> "FizzBuzz"
    (0, b, c) -> "Fizz"
    (a, 0, c) -> c
end

IO.puts fizz_buzz.(0, 0, 1)
IO.puts fizz_buzz.(0, 1, 1)
IO.puts fizz_buzz.(1, 0, 3)

# Closure/nested function example
prefix = fn pre -> (fn suffix -> pre <> " " <> suffix end) end
mrs = prefix.("Mrs")

IO.puts mrs.("Smith")
IO.puts prefix.("Elixir").("Rocks")

# Module and named function creation examples
defmodule Times do
    def triple(n) do
        n * 3
    end
end

IO.puts Times.triple(3)

defmodule Sums do
    def sum_up_to(0), do: 0
    def sum_up_to(n), do: n + sum_up_to(n - 1)
end

IO.puts Sums.sum_up_to(6)

# Guard clause example
defmodule Guesser do
    def guess(actual, range) do
        first..last = range
        current_guess = div(first + last, 2)
        IO.puts "Is it " <> to_string(current_guess) <> "?"
        guess(actual, range, current_guess)
    end
    
    def guess(actual, range, last_guess) when last_guess > actual do
        first..last = range
        guess(actual, first..last_guess)
    end
        
    def guess(actual, range, last_guess) when last_guess < actual do
        first..last = range
        guess(actual, last_guess..last)
    end
        
    def guess(actual, range, last_guess) when last_guess == actual do
        IO.puts last_guess
    end
end
        
Guesser.guess(1013, 1..10000) 
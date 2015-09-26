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

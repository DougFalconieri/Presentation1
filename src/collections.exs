defmodule Lists do
    def mapsum(list, func) do
        _mapsum(list, func, 0)
    end
    
    defp _mapsum([], _, result), do: result
    
    defp _mapsum([head | tail], func, result) do
        _mapsum(tail, func, result + func.(head))
    end
end

IO.inspect Lists.mapsum [1, 2, 3], &(&1 * &1)
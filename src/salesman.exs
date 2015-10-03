defmodule Salesman do
    # permute algorithm based on code from http://rosettacode.org/wiki/Permutations#Elixir
    def permute([]), do: [[]]
    
    def permute(items) do
        for x <- items, y <- permute(items -- [x]), do: [x | y]
    end
    
    def gen_data(num) do
        Enum.map(1..num, fn(n) -> {n, (:random.uniform 1000), (:random.uniform 1000)} end)
    end
    
    def distance([]), do: 0
    def distance([_]), do: 0
    def distance([first, second | tail]) do
        distance(first, second) + distance([second | tail])
    end
    
    def distance({_, x_i, y_i}, {_, x_j, y_j}) do
        :math.pow(x_i - x_j, 2) + :math.pow(y_i - y_j, 2)
    end
    
    def measure_routes(routes) do
        Enum.map(routes, fn(route) -> {route, distance(route)} end)
    end
    
    def min_by_dist(routes), do: Enum.min_by(routes, fn({_, dist}) -> dist end)
    
    def min_route(routes) do
        routes |> measure_routes |> min_by_dist
    end
    
    # Partition algorithm based on code by "chops" on  http://stackoverflow.com/questions/12534898/splitting-a-list-in-equal-sized-chunks-in-erlang
    def partition_routes([], _), do: []   
    def partition_routes(routes, num_parts) when num_parts > length(routes), do: [routes]
    def partition_routes(routes, num_parts) do
        {head, tail} = Enum.split(routes, num_parts)
        [head | partition_routes(tail, num_parts)]
    end
    
    def partition_routes_4(routes), do: partition_routes(routes, 4)
    
    def min_route_parallel(partitions) do
        tasks = Enum.map(partitions, fn(partition) -> Task.async(fn -> min_route(partition) end) end)
        Enum.map(tasks, fn(task) -> Task.await(task) end) |> min_by_dist
    end
    
    def compute(locations) do
        locations |> permute |> min_route
    end
    
    def compute_parallel(locations) do
        locations |> permute |> partition_routes_4 |> min_route_parallel
    end
end

locations = Salesman.gen_data(9)
IO.puts "Synchronous:"
{sync_time, sync_result} = :timer.tc(fn -> Salesman.compute(locations) end, [])
IO.inspect sync_result
IO.puts "Took #{sync_time / 1000000} seconds"
IO.puts "Parallel:"
{p_time, p_result} = :timer.tc(fn -> Salesman.compute(locations) end, [])
IO.inspect p_result
IO.puts "Took #{p_time / 1000000} seconds"
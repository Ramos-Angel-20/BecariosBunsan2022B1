defmodule BecariosBunsan2022B1.FizzBuzz do

  def check(x) do
    cond do
      rem(x, 3) == 0 and rem(x, 5) == 0-> IO.puts "FizzBuzz"
      rem(x, 3) == 0 -> IO.puts "Fizz"
      rem(x, 5) == 0-> IO.puts "Buzz"
      true -> IO.puts x
    end
  end

  def fizzbuzz(value) do
    Enum.each(1..value, fn x -> check(x) end)
  end

end

defmodule FizzBuzzTest do
  use ExUnit.Case
  doctest BecariosBunsan2022B1.FizzBuzz

  test "Verify Fizzbuzz" do
    assert BecariosBunsan2022B1.FizzBuzz.check(15) == IO.puts "Fizzbuzz"
  end

  test "Verify Fizz" do
    assert BecariosBunsan2022B1.FizzBuzz.check(9) == IO.puts "Fizz"
  end

  test "Verify Buzz" do
    assert BecariosBunsan2022B1.FizzBuzz.check(50) == IO.puts "Buzz"
  end
end

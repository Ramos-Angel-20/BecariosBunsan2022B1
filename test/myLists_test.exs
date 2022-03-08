defmodule MyListsTest do
  use ExUnit.Case
  doctest BecariosBunsan2022B1.MyLists

  describe "Test each function" do
    test "Test duplicating value of each element" do
      assert BecariosBunsan2022B1.MyLists.each([1,2,3,4], fn x -> x * 2 end) == [2,4,6,8]
    end

    test "Test adding 1 to each element" do
      assert BecariosBunsan2022B1.MyLists.each([1,2,3,4], fn x -> x + 1 end) == [2,3,4,5]
    end

    test "Test subtracting 1 to each element" do
      assert BecariosBunsan2022B1.MyLists.each([1,2,3,4], fn x -> x - 1 end) == [0,1,2,3]
    end
  end

  describe "Test map function" do
    test "Test duplicating value of each element" do
      assert BecariosBunsan2022B1.MyLists.map([1,2,3,4], fn x -> x * 2 end) == [2,4,6,8]
    end

    test "Test adding 1 to each element" do
      assert BecariosBunsan2022B1.MyLists.map([1,2,3,4], fn x -> x + 1 end) == [2,3,4,5]
    end

    test "Test subtracting 1 to each element" do
      assert BecariosBunsan2022B1.MyLists.map([1,2,3,4], fn x -> x - 1 end) == [0,1,2,3]
    end
  end

  describe "Test reduce function" do
    test "Sum up values" do
      assert BecariosBunsan2022B1.MyLists.reduce([1,2,3,4,5], fn x, acc -> x + acc end, 0) == 15
    end

    test "Multiply and store in list" do
      assert  BecariosBunsan2022B1.MyLists.reduce([1,2,3,4,5], fn x, acc -> [x * 2|acc] end, []) |>
      Enum.reverse() == [2, 4, 6, 8, 10]
    end
  end

  describe "Test zip function" do
    test "Pairing basic values" do
      assert BecariosBunsan2022B1.MyLists.zip([:one, :two, :three],  ["one", "two", "three"]) == [one: "one", two: "two", three: "three"]
    end

    test "Pairing no matching lists length" do
      assert BecariosBunsan2022B1.MyLists.zip([:one, :two, :three, :four, :five],  ["one", "two", "three"]) == [one: "one", two: "two", three: "three"]
    end

  end

  describe "Test zip_with function" do
    test "Sum paired values" do
      assert BecariosBunsan2022B1.MyLists.zip_with([1,2,3,4,5,6,7],[8,9,10,11,13,14,15], fn x, y -> x + y end) == [9, 11, 13, 15, 18, 20, 22]
    end

    test "Subtract paired values" do
      assert BecariosBunsan2022B1.MyLists.zip_with([1,2,3,4,5,6,7],[8,9,10,11,13,14,15], fn x, y -> x - y end) == [-7, -7, -7, -7, -8, -8, -8]
    end

    test "Sum paired values of no matching length lists" do
      assert BecariosBunsan2022B1.MyLists.zip_with([1,2,3,4,5,6,7],[8,9,10,11,13,14,15,16,17,18], fn x, y -> x + y end) == [9, 11, 13, 15, 18, 20, 22]
    end
  end
end

defmodule BecariosBunsan2022B1.MyLists do

  # each
  def each([], _fun), do: []
  def each([head | tail], fun), do: [fun.(head) | each(tail, fun)]





  # map
  # Con pattern matching se evita el error "map has no local return", esto para cuando la lista del tail ya esta vacio
  def map([], _fun) do
    []
  end

  def map(list, fun) do
    [head | tail] = list
    new_head = fun.(head)
    # Devolvemos una lista con new_head y el tail (resto de la lista que aun no ha sido modificado)
    [new_head | map(tail, fun)]
  end





  # reduce
  # testeado con MyLists.reduce([1,2,3,4,5], fn x, acc -> x + acc end, 0)
  def reduce(list, fun) do
    [h | t] = list
    reduce(t, fun, h)
  end

  def reduce([], _fun, acc) do
    acc
  end

  def reduce([h|t], fun, acc) do
    res = fun.(h, acc)
    reduce(t, fun, res)
  end





  # zip
  # def zip(list1, list2) do
  #   [h1 | t1] = list1
  #   [h2 | t2] = list2

  #   tuple = { h1, h2 }

  #   zip(t1, t2, [tuple])
  # end

  # # Aqui se maneja el caso en donde los dos tails ya esten vacios
  # defp zip([], [], list) do
  #   list
  # end

  # defp zip(list1, list2, list_of_tuples) do
  #   [h1 | t1] = list1
  #   [h2 | t2] = list2

  #   tuple = { h1, h2 }

  #   new_list = Enum.concat(list_of_tuples, [tuple])
  #   zip(t1, t2, new_list)
  # end

  # test with => MyLists.zip([1,2,3], [:a, :b, :c])

  # Casos bases para cuando las listas no tengan la misma longitud
  def zip([], _), do: [] # TODO: Test
  def zip(_, []), do: [] # TODO: Test

  def zip([], []) do
    []
  end

  def zip(list1, list2) do
    [h1 | t1] = list1
    [h2 | t2] = list2

    tuple = { h1, h2 }
    [tuple | zip(t1, t2)]
  end



  # zip_with/3
  # Testeado con => MyLists.zip_with([1,2,3,4,5,6,7],[8,9,10,11,13,14,15], fn x, y -> x + y end)

  #Casos bases para cuando las listas no tengan la misma longitud
  def zip_with([], _, _), do: [] # TODO: Test
  def zip_with(_, [], _), do: [] # TODO: Test

  def zip_with([], [], _fun) do # Esta función maneja cuando ya esten vacios los dos tails
    []
  end

  def zip_with(list1, list2, fun) do
    [head1 | tail1] = list1
    [head2 | tail2] = list2

    new_head = fun.(head1, head2)

    [new_head | zip_with(tail1, tail2, fun)]
  end
end

defmodule Ex01 do

  @moduledoc """

  In this exercise you'll implement a simple process that acts as a
  counter. Each time you send it `{:next, from}`, it will send to
  `from` the tuple `{:next_is, value}`, and that value will increase
  by one on each call. You code will allow you to set the initial
  value returned.

  The tests in the following module are commented out.

  You'll uncomment each in turn, and then write the code in the
  Ex01 module to make that test pass. You've finished when all the
  tests are uncommented and pass.

  Do NOT use the Task or Agent libraries for this test.
  """

  def counter(value \\ 0) do
    # ...your code
  end

  def new_counter(initial_value \\ 0) do
    # ... your code
  end

  def next_value(counter_pid) do
    # ... your code
  end
end

ExUnit.start()

defmodule Test do
  use ExUnit.Case

  # Start by enabling this test and getting it to pass
  # This test assumes you have a function `counter` that can be spawned
  # and which handles the `{:next, from}` message

  @tag :skip   # delete this line to enable the test that follows

  test "basic message interface" do
    count = spawn Ex01, :counter, []
    send count, { :next, self() }
    receive do
      { :next_is, value } ->
        assert value == 0
    end

    send count, { :next, self() }
    receive do
      { :next_is, value } ->
        assert value == 1
    end
    IO.puts "missing first test"
  end

  # then enable this one
  # Now we add two new functions to Ex01 that wrap the use of
  # that counter function, making the overall API cleaner

  @tag :skip

  test "higher level API interface" do
    count = Ex01.new_counter(5)
    assert  Ex01.next_value(count) == 5
    assert  Ex01.next_value(count) == 6
  end

end

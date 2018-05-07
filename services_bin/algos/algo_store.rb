module AlgoStore

  def fibonacci_iter(n)
    return 0 if n < 1
    fib = (2..n).inject([0,1]) {|fib| fib << fib.last(2).inject(:+)}
    fib[-1]
  end


  def fibonacci_recurs(n)
    return 0 if n == 0
    return 1 if n <= 2
    fibonacci_recurs(n - 1) + fibonacci_recurs(n - 2)
  end


  def factorial_iter(n)
    (1..n).reduce(1, :*)
  end

  ## Refactored above
  # def factorial_iter(n)
  #   n = 1 if n == 0
  #   (1..n).inject { |sum,nxt| sum * nxt }
  # end

  def factorial_recurs(n)
    return 1 if n < 2
    n * factorial_recurs(n - 1)
  end


end

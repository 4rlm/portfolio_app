module AlgoMath

  ############ Fibonaccis Below ############

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


  ############ Factorials Below ############


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


  ############ Searches Below ############

  # AlgosService.new.linear_search
  def linear_search(args={})
    arr = args.fetch(:arr, sample_arr)
    target = args.fetch(:target, sample_target(arr))

    i = 0
    while i < arr.length
      return i if arr[i] == target
      i+=1
    end
  end


  # AlgosService.new.global_linear_search
  def global_linear_search(args={})
    arr = args.fetch(:arr, sample_arr)
    target = args.fetch(:target, sample_target(arr))

    i = 0
    indices = []

    while i < arr.length
      indices << i if arr[i] == target
      i+=1
    end

    indices
  end


  # AlgosService.new.iterative_binary_search
  def iterative_binary_search(args={})
    arr = args.fetch(:arr, sample_arr)
    target = args.fetch(:target, sample_target(arr))
    low = 0
    hi = arr.length

    while low < hi
      mid = (low + hi) / 2
      return mid if arr[mid] == target
      arr[mid] < target ? low = mid + 1 : hi = mid
    end

    false
  end





  ############ Generates Sample Arr and Target ############
  def sample_arr
    # sample_arr = "bananas".chars
    sample_arr = 'austin'.chars.sort
    # sample_arr = [:Q, :O, :A, :A, :C, :G, :S, :U]
  end

  def sample_target(arr)
    middle = arr.length / 2
    sample_target = arr[middle]
  end




end

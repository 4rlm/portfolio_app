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


  ####### Subset W/ Factorial Below #######

  # subset_count(0, 5)  # => 0
  # subset_count(6, 3)  # => 20
  # AlgoService.new.find_subsets(6, 3)
  def find_subsets(n, r)
    fn = factorial_iter(n)
    fr = factorial_iter(r)
    ncr = fn / ( fr * factorial_iter((n - r)) )
  end


  ############ Searches Below ############

  # AlgoService.new.linear_search
  def linear_search(args={})
    arr = args.fetch(:arr, sample_arr)
    target = args.fetch(:target, sample_target(arr))

    i = 0
    while i < arr.length
      return i if arr[i] == target
      i+=1
    end
  end


  # AlgoService.new.global_linear_search
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


  # AlgoService.new.iterative_binary_search
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



  ############ Shuffle Below ############

  # AlgoService.new.shuffle
  def shuffle(args={})
    sample_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
    arr = args.fetch(:arr, sample_array)

    input = arr.clone
    output = []
    len = input.length

    while len > 0
      r = Random.rand(0..len-1)
      output << input[r]
      input.delete_at(r)
      len = input.length
    end
    output
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

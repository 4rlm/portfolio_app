module AlgoBench

  def benchmark
    start_time = Time.now
    calculation = yield
    end_time = Time.now
    run_time = end_time - start_time
    run_time
  end


  # bench = AlgosService.new.bench_fibonacci_iter(5)
  def run_benchmark
    bench_rounds = @bench_rounds || 500
    binding.pry
    bench_res = benchmark { yield * bench_rounds }
    bench_hsh = {rounds: bench_rounds, time: bench_res}
  end


  # benches = AlgosService.new.run_all_benchmarks(5, 20)
  def run_all_benchmarks(input, rounds)
    @bench_rounds = rounds
    benches = [ bench_fibonacci_iter(input),
                bench_fibonacci_recurs(input),
                bench_factorial_iter(input),
                bench_factorial_recurs(input)
              ]
  end


  # bench = AlgosService.new.bench_fibonacci_iter(5)
  def bench_fibonacci_iter(n)
    about_hsh = {algo: 'fibonacci_iter', input: n}
    bench_hsh = run_benchmark { fibonacci_iter(n) }
    struct = OpenStruct.new(about_hsh.merge(bench_hsh))
  end

  def bench_fibonacci_recurs(n)
    about_hsh = {algo: 'fibonacci_recurs', input: n}
    bench_hsh = run_benchmark { fibonacci_recurs(n) }
    struct = OpenStruct.new(about_hsh.merge(bench_hsh))
  end

  def bench_factorial_iter(n)
    about_hsh = {algo: 'factorial_iter', input: n}
    bench_hsh = run_benchmark { factorial_iter(n) }
    struct = OpenStruct.new(about_hsh.merge(bench_hsh))
  end

  def bench_factorial_recurs(n)
    about_hsh = {algo: 'factorial_recurs', input: n}
    bench_hsh = run_benchmark { factorial_recurs(n) }
    struct = OpenStruct.new(about_hsh.merge(bench_hsh))
  end








end

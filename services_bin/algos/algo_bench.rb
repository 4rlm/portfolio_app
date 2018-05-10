require 'benchmark'
require 'benchmark/ips'

module AlgoBench

  # bench = AlgoService.new.run_all_benchmarks
  def run_all_benchmarks(args={})
    num = args.fetch(:num, nil)
    num = rand(20..30) if !num.present?
    report_hashes = []
    report_hashes << bench_fibonacci_iter(num)
    report_hashes << bench_fibonacci_recurs(num)
    report_hashes << bench_factorial_iter(num)
    report_hashes << bench_factorial_recurs(num)
    convert_results(report_hashes)
  end


  def bench_fibonacci_iter(num)
    output = nil
    bm_hsh = Benchmark.bm do |x|
      x.report { output = fibonacci_iter(num) }
    end
    report_hsh = { algo: 'fibonacci_iter', input: num, output: output }
    report_hsh = report_hsh.merge(bm_hsh.first.as_json)
  end


  def bench_fibonacci_recurs(num)
    output = nil
    bm_hsh = Benchmark.bm do |x|
      x.report { output = fibonacci_recurs(num) }
    end
    report_hsh = { algo: 'fibonacci_recurs', input: num, output: output }
    report_hsh = report_hsh.merge(bm_hsh.first.as_json)
  end


  def bench_factorial_iter(num)
    output = nil
    bm_hsh = Benchmark.bm do |x|
      x.report { output = factorial_iter(num) }
    end
    report_hsh = { algo: 'factorial_iter', input: num, output: output }
    report_hsh = report_hsh.merge(bm_hsh.first.as_json)
  end


  def bench_factorial_recurs(num)
    output = nil
    bm_hsh = Benchmark.bm do |x|
      x.report { output = factorial_recurs(num) }
    end
    report_hsh = { algo: 'factorial_recurs', input: num, output: output }
    report_hsh = report_hsh.merge(bm_hsh.first.as_json)
  end


end

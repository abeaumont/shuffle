module: shuffle-benchmark
synopsis: Simple benchmark for shuffle algorithm.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND

define function main (name :: <string>, arguments :: <vector>)
  let n = string-to-integer(element(arguments, 0, default: 1));
  for (type in vector(<list>, <deque>, <array>, <vector>))
    let sequence = make(type, size: n);
    profiling (cpu-time-seconds, cpu-time-microseconds)
      for (i from 0 below n)
        sequence[i] := i + 1;
      end for;
      shuffle!(sequence);
    results
      let class-name = sequence.object-class.debug-name;
      format-out("%s: took %d.%s seconds\n", class-name, cpu-time-seconds,
                 integer-to-string(cpu-time-microseconds, size: 3));
    end profiling;
  end for;
  exit-application(0);
end function main;

main(application-name(), application-arguments());

module: shuffle-benchmark
synopsis: Simple benchmark for shuffle algorithm.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND

define function main (name :: <string>, arguments :: <vector>)
  let n = string-to-integer(element(arguments, 0, default: 1));
  for (fn in vector(shuffle, shuffle!))
    for (type in vector(<list>, <deque>, <array>, <vector>))
      let sequence = make(type, size: n);
      for (i from 0 below n) sequence[i] := i + 1 end;
      profiling (cpu-time-seconds, cpu-time-microseconds)
        fn(sequence);
      results
        format-out("%s(%s): took %d.%s seconds\n", fn.debug-name,
                   sequence.object-class.debug-name, cpu-time-seconds,
                   integer-to-string(cpu-time-microseconds, size: 3));
      end profiling;
    end for;
  end for;
  exit-application(0);
end function main;

main(application-name(), application-arguments());

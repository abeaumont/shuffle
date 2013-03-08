module: shuffle-benchmark
synopsis: Simple benchmark for shuffle algorithm.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND

define function main (name :: <string>, arguments :: <vector>)
  profiling (cpu-time-seconds, cpu-time-microseconds)
    let sequence = make(<vector>, size: 10000000);
    for (i from 0 below 10000000)
      sequence[i] := i + 1;
    end for;
    shuffle!(sequence);
  results
    format-out("took %d.%s seconds\n", cpu-time-seconds,
               integer-to-string(cpu-time-microseconds, size: 3));
  end profiling;
  exit-application(0);
end function main;

main(application-name(), application-arguments());

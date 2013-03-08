module: dylan-user
synopsis: Simple benchmark for shuffle algorithm.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND

define library shuffle-benchmark
  use common-dylan;
  use io;
  use shuffle;
end library;

define module shuffle-benchmark
  use common-dylan, exclude: { format-to-string };
  use simple-profiling;
  use format-out;
  use shuffle;
end module;

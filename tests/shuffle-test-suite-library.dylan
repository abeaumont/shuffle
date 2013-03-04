module: dylan-user
synopsis: Testsuite for shuffle algorithm.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND


define library shuffle-test-suite
  use dylan;
  use common-dylan;
  use testworks;
  use shuffle;

  export shuffle-test-suite;
end library shuffle-test-suite;

define module shuffle-test-suite
  use dylan-extensions, exclude: { test-function };
  use common-dylan, exclude: { format-to-string };
  use testworks;
  use shuffle;

  export shuffle-test-suite;
end module shuffle-test-suite;

module: dylan-user
synopsis: Test application for shuffle algorithm.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND


define library shuffle-test-suite-app
  use testworks;
  use shuffle-test-suite;
end library shuffle-test-suite-app;

define module shuffle-test-suite-app
  use testworks;
  use shuffle-test-suite;
end module shuffle-test-suite-app;
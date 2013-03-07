module: shuffle-test-suite
synopsis: Testsuite for shuffle algorithm.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND


define suite shuffle-test-suite ()
  test shuffle-size-test;
  test shuffle!-size-test;
end suite shuffle-test-suite;

define test shuffle-size-test ()
  for (type in vector(<list>, <deque>, <array>, <vector>))
    let shuffled = shuffle(make(type, size: 4));
    // Just make sure it works for TYPE
    check-equal(concatenate("shuffle for ", debug-name(object-class(type))),
                shuffled.size, 4);
  end for;
end test shuffle-size-test;

define test shuffle!-size-test ()
  for (type in vector(<list>, <deque>, <array>, <vector>))
    let shuffled = shuffle!(make(type, size: 4));
    // Just make sure it works for TYPE
    check-equal(concatenate("shuffle! for ", debug-name(object-class(type))),
                shuffled.size, 4);
  end for;
end test shuffle!-size-test;
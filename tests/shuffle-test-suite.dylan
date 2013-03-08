module: shuffle-test-suite
synopsis: Testsuite for shuffle algorithm.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND


define suite shuffle-test-suite ()
  test shuffle-size-test;
  test shuffle-elements-test;
  test shuffle!-size-test;
  test shuffle!-elements-test;
end suite shuffle-test-suite;

define test shuffle-size-test ()
  for (type in vector(<list>, <deque>, <array>, <vector>))
    let shuffled = shuffle(make(type, size: 4));
    check-equal(concatenate("shuffle for ", debug-name(object-class(shuffled))),
                shuffled.size, 4);
  end for;
end test shuffle-size-test;

define test shuffle-elements-test ()
  for (type in vector(<list>, <deque>, <array>, <vector>))
    let elements = make(type, size: 4);
    for (i from 0 below elements.size) elements[i] := i end;
    let shuffled = shuffle(elements);
    check-equal(concatenate(debug-name(object-class(elements)),
                            ": shuffle size = 4"),
                shuffled.size, 4);
    check-equal(concatenate(debug-name(object-class(elements)),
                            ": shuffle sum = 6"),
                reduce1(\+, shuffled), 6);
  end for;
end test shuffle-elements-test;

define test shuffle!-size-test ()
  for (type in vector(<list>, <deque>, <array>, <vector>))
    let shuffled = shuffle!(make(type, size: 4));
    check-equal(concatenate("shuffle! for ", debug-name(object-class(shuffled))),
                shuffled.size, 4);
  end for;
end test shuffle!-size-test;

define test shuffle!-elements-test ()
  for (type in vector(<list>, <deque>, <array>, <vector>))
    let elements = make(type, size: 4);
    for (i from 0 below elements.size) elements[i] := i end;
    let shuffled = shuffle!(elements);
    check-equal(concatenate(debug-name(object-class(elements)),
                            ": shuffle! size = 4"),
                shuffled.size, 4);
    check-equal(concatenate(debug-name(object-class(elements)),
                            ": shuffle! sum = 6"),
                reduce1(\+, shuffled), 6);
  end for;
end test shuffle!-elements-test;
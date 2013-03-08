module: shuffle-test-suite
synopsis: Testsuite for shuffle algorithm.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND


define suite shuffle-test-suite ()
  test shuffle-type-test;
  test shuffle-size-test;
  test shuffle-sum-test;
  test shuffle!-type-test;
  test shuffle!-size-test;
  test shuffle!-sum-test;
end suite shuffle-test-suite;

define test shuffle-type-test ()
  for (type in vector(<list>, <deque>, <array>, <vector>))
    let sequence = make(type, size: 4);
    let shuffled = shuffle(sequence);
    check-equal("shuffle types match", sequence.object-class,
                shuffled.object-class);
  end for;
end test shuffle-type-test;

define test shuffle-size-test ()
  for (type in vector(<list>, <deque>, <array>, <vector>))
    let shuffled = shuffle(make(type, size: 4));
    check-equal(concatenate("shuffle for ", shuffled.object-class.debug-name),
                shuffled.size, 4);
  end for;
end test shuffle-size-test;

define test shuffle-sum-test ()
  for (type in vector(<list>, <deque>, <array>, <vector>))
    let sequence = make(type, size: 4);
    for (i from 0 below sequence.size) sequence[i] := i end;
    let shuffled = shuffle(sequence);
    check-equal(concatenate(sequence.object-class.debug-name,
                            ": shuffle size = 4"),
                shuffled.size, 4);
    check-equal(concatenate(sequence.object-class.debug-name,
                            ": shuffle sum = 6"),
                reduce1(\+, shuffled), 6);
  end for;
end test shuffle-sum-test;

define test shuffle!-type-test ()
  for (type in vector(<list>, <deque>, <array>, <vector>))
    let sequence = make(type, size: 4);
    let shuffled = shuffle!(sequence);
    check-equal("shuffle types match", sequence.object-class,
                shuffled.object-class);
  end for;
end test shuffle!-type-test;

define test shuffle!-size-test ()
  for (type in vector(<list>, <deque>, <array>, <vector>))
    let shuffled = shuffle!(make(type, size: 4));
    check-equal(concatenate("shuffle! for ", shuffled.object-class.debug-name),
                shuffled.size, 4);
  end for;
end test shuffle!-size-test;

define test shuffle!-sum-test ()
  for (type in vector(<list>, <deque>, <array>, <vector>))
    let sequence = make(type, size: 4);
    for (i from 0 below sequence.size) sequence[i] := i end;
    let shuffled = shuffle!(sequence);
    check-equal(concatenate(sequence.object-class.debug-name,
                            ": shuffle! size = 4"),
                shuffled.size, 4);
    check-equal(concatenate(sequence.object-class.debug-name,
                            ": shuffle! sum = 6"),
                reduce1(\+, shuffled), 6);
  end for;
end test shuffle!-sum-test;
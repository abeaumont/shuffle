module: shuffle
synopsis: Fisher-Yates shuffle algorithm.
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND


define generic shuffle! 
    (sequence :: <mutable-sequence>)
 => (sequence! :: <mutable-sequence>);

define method shuffle!
    (sequence :: <mutable-sequence>)
 => (sequence! :: <mutable-sequence>);
  for (i from sequence.size - 1 to 1 by -1)
    let n = random(i);
    let tmp = sequence[i];
    sequence[i] := sequence[n];
    sequence[n] := tmp;
  end for;
  sequence;
end method shuffle!;

define generic shuffle
    (sequence :: <mutable-sequence>)
 => (sequence! :: <mutable-sequence>);

define method shuffle
    (sequence :: <mutable-sequence>)
 => (sequence! :: <mutable-sequence>);
  shuffle!(copy-sequence(sequence));
end method shuffle;
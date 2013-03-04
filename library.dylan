module: dylan-user
synopsis: Fisher-Yates shuffle algorithm
author: Alfredo Beaumont <alfredo.beaumont@gmail.com>
copyright: See LICENSE file in this distribution.
warranty: Distributed WITHOUT WARRANTY OF ANY KIND

define library shuffle
  use common-dylan;

  export shuffle;
end library;

define module shuffle
  use common-dylan, exclude: { format-to-string };
  use simple-random;

  export shuffle, shuffle!;
end module;

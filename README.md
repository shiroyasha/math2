# Math expression parser

[![Build Status](https://semaphoreci.com/api/v1/shiroyasha/math2/branches/master/badge.svg)](https://semaphoreci.com/shiroyasha/math2)

Simple math parser using flex/bison.

## Usage

First, clone the project:

``` bash
git clone git@github.com:shiroyasha/math2.git
cd math2
```

Then, compile the binary:

``` bash
make
```

Then, run it and enjoy:

``` bash
bin/math
```

## Tests

For testing, we use [google-tests](https://github.com/google/googletest). All
tests can be found in the `test` directory.

To run the tests, first set up the `gtest` library:

``` bash
scripts/setup_gtest.sh
```

Then, run the tests:

``` bash
make test
```

## LICENSE

The MIT License (MIT)
Copyright (c) 2016 Igor Sarcevic

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

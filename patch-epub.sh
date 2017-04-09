#! /bin/sh
#
set -eux

O=$(pwd)
T=$(mktemp -d)

cd $T

unzip -d . $O/book.epub

# remove not allowed "data-lang" attribute from HTML files.
find . -type f -name '*.html' | xargs sed -i.bak 's/data-lang="[^"]*"//g'
find . -type f -name '*.bak' | xargs rm

# change "_target" to "target"
find . -type f -name '*.html' | xargs sed -i.bak 's/_target/target/g'
find . -type f -name '*.bak' | xargs rm

zip -u $O/book.epub *

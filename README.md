# NYUCore

<!-- [![Gem Version](https://badge.fury.io/rb/nyucore.png)](http://badge.fury.io/rb/nyulibraries-nyucore) -->
[![Build Status](https://api.travis-ci.org/NYULibraries/nyucore.png?branch=master)](https://travis-ci.org/NYULibraries/nyucore)
[![Dependency Status](https://gemnasium.com/NYULibraries/nyucore.png)](https://gemnasium.com/NYULibraries/nyucore)
[![Code Climate](https://codeclimate.com/github/NYULibraries/nyucore.png)](https://codeclimate.com/github/NYULibraries/nyucore)
[![Coverage Status](https://coveralls.io/repos/NYULibraries/nyucore/badge.png?branch=master)](https://coveralls.io/r/NYULibraries/nyucore)

NYUCore is a metadata vocabulary built for describing core elements of NYU's Digital Collections
and easing interoperability among them.
This :gem: helps ruby applications manage NYUCore.

## Fields
An `NyuCore::Field` is a metadata element.
A `Field` must have one of the following names:

    :identifier, :access_url, :archive_url, :title, :alternative,
    :vernacular, :uniform, :type, :is_part_of, :collection_id, :creator,
    :contributor, :isbn, :issn, :subject, :genre, :classification, :date,
    :modified, :publisher, :language, :coverage, :spatial, :temporal,
    :extent, :format, :description, :abstract, :full_text, :rights

It will raise an `ArgumentError` if you're doing it wrong.


## Records
An `NyuCore::Record` is a collection of `NyuCore::Fields`.

## Versioning
We try to use [semantic versioning](http://semver.org/), major versions may break you :poop:

## Contributing
NyuCore is, and should be, constantly evolving as we at NYU get better
at representing our digital collections, which is awesome :metal:

We love tests. Contributions should be fully tested with
[RSpec](https://www.relishapp.com/rspec/). If you write your tests first,
(and follow [RSpec best practices](http://betterspecs.org/)) you'll probably
[write better code](http://blog.c42.in/blog/tdd-isnt-about-testing-its-about-design).

To run your RSpec suite, you can use `rake`

    $ bundle exec rake

or just `rspec`

    $ bundle exec rspec

## Gem Releases
We use bundler's awesome rake task to push our gem rubygems.
  
    $ bundle exec rake release
  
If you need a new release, or tag or whatever, let us know in the issues.

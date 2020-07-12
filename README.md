# minifier [![Version][gem_badge]][gem_url] [![Build Status][build_badge]][build_status]
CLI tool and server to minify your URLs.

## Example
```console
$ mmini https://github.com/simeg
https://mmini.herokuapp.com/g5ORz_63J
```

## Installation
Install `mmini` using `gem`. If you're on macOS you're not allowed to install gems to the shared
Ruby location. To work around this you have a couple of alternatives.

1) Install the gem locally to your user. This is what I recommend unless you're a Ruby developer.
    ```sh
    gem install mmini --user-install
    ```

2) Use a Ruby version manager such as [`rbenv`](https://github.com/rbenv/rbenv). If you're writing Ruby code it's probably a good idea
   to use `rbenv` anyway.

[build_badge]: https://travis-ci.org/simeg/minifier.svg?branch=master
[build_status]: https://travis-ci.org/simeg/minifier
[gem_badge]: https://img.shields.io/gem/v/mmini.svg
[gem_url]: https://rubygems.org/gems/mmini

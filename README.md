# mmini [![Version][gem_badge]][gem_url] ![CI][build_badge]
CLI tool and server to minify your URLs.

## Example
```console
$ mmini https://github.com/simeg
https://mmini.herokuapp.com/g5ORz_63J
```

## Installation
Install `mmini` using `gem`. If you're on macOS you're not allowed to install gems to the shared
Ruby location. To work around this you have a couple of alternatives.

1) Install the gem using Homebrew. To install gems with Homebrew you first need to install `brew-gem`.
   ```sh
   brew install brew-gem
   brew gem install mmini
   ```

2) Install the gem locally to your user.
    ```sh
    gem install mmini --user-install
    ```

2) Use a Ruby version manager such as [`rbenv`](https://github.com/rbenv/rbenv). If you're writing Ruby code it's probably a good idea
   to use `rbenv` anyway.

[build_badge]: https://github.com/simeg/mmini/workflows/CI/badge.svg
[gem_badge]: https://img.shields.io/gem/v/mmini.svg
[gem_url]: https://rubygems.org/gems/mmini

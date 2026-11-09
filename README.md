# package-rb

Ruby reference package: a gem library, a CLI example, Minitest tests, and
RubyGems release notes.

## Layout

| Path | Holds |
| --- | --- |
| `lib/` | publishable gem code |
| `test/` | Minitest tests |
| `examples/cli.rb` | full CLI example |
| `docs/` | usage and release notes |

## Build

```bash
bundle install
bundle exec rake test
```

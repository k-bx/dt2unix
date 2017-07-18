# dt2unix

Installation:

```
stack install
```

Ensure that `~/.local/bin` is in your `PATH`.

Example usage:

```
$ dt2unix --date "2017-06-14 00:00:00 UTC"
1497398400
$ unix2dt --date 1497398400
2017-06-14 00:00:00 UTC
```

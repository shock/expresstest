# Express Test

Experimenting with Express, routing, using the waterline ORM with the `sails-postgresql` adapter

## Notes

Use `$ vnm <modulename>` to open a locally installed node module in Sublime
Use `$ nr <scriptname>` to run a script defined in `packages.json`

To drop the database and rebuild it from the model definitions:
```
$ MIGRATE=drop bin/www
```
or

```
$ nr drop
```

## Debugging using Chrome DevTools
```
$ nr debug
```
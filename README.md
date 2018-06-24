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

#### Nodemon

You can use `nodemon` to auto-restart the app when files are changed.  See `nodemonConfig` section of `package.json` for details.

Start the app using `nodemon`:

`$ nodemon`

Note: Since `bin/www` does not have a file extension, you have to manually restart the app by typing `rs` into the terminal where `nodemon` is running.


## Debugging using Chrome DevTools
```
$ nr debug
```

## TODO
* Investigate using `sails-hook-orm` module to integrate migrations more conventionally
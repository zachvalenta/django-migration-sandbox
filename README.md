# what is this?

Sandbox for exploring migration scenarios

## run locally

* install dependencies: `poetry install`
* create migrations: `make create`
* apply migrations: `make apply`
* create superuser: `make super`
* start dev server: `make srv`

```Makefile
======================================================================

🛠  UTILS

srv:        run dev server
super:      create superuser

🗄  MIGRATIONS

create:     make migration file
apply:      apply migration file
revert:     rm migration files

📡  API - shell

hc:         get healthcheck endpoint
list:       get all resources
one:        get single resource
post:       create single resource
patch:      partial update of single resource (title)
put:        full update of single resource (title, description)

🛰  API - browsable

gui-list:   get all resources
gui-one:    get single resources

🖥  OTHER INTERFACES

repl:       explore models from shell
admin:      open admin

📦 DEPENDENCIES

env:        show environment info
deps:       list prod dependencies

======================================================================
```

.PHONY: test
base_url = "http://localhost:8000"
api_url = "http://localhost:8000/api"

help:
	@echo
	@echo "======================================================================"
	@echo
	@echo "🛠  UTILS"
	@echo
	@echo "srv:        run dev server"
	@echo "super:      create superuser"
	@echo
	@echo "🗄  MIGRATIONS"
	@echo
	@echo "create:     make migration file"
	@echo "apply:      apply migration file"
	@echo "revert:     rm migration files"
	@echo
	@echo "📡  API - shell"
	@echo
	@echo "hc:         get healthcheck endpoint"
	@echo "list:       get all resources"
	@echo "one:        get single resource"
	@echo "post:       create single resource"
	@echo "patch:      partial update of single resource (title)"
	@echo "put:        full update of single resource (title, description)"
	@echo
	@echo "🛰  API - browsable"
	@echo
	@echo "gui-list:   get all resources"
	@echo "gui-one:    get single resources"
	@echo
	@echo "🖥  OTHER INTERFACES"
	@echo
	@echo "repl:       explore models from shell"
	@echo "admin:      open admin"
	@echo
	@echo "📦 DEPENDENCIES"
	@echo
	@echo "env:        show environment info"
	@echo "deps:       list prod dependencies"
	@echo
	@echo "======================================================================"
	@echo

#
# 🛠 UTILS
#

srv:
	poetry run python manage.py runserver

super:
	poetry run python manage.py createsuperuser

#
# 🗄 MIGRATIONS
#

create:
	poetry run python manage.py makemigrations

apply:
	poetry run python manage.py migrate

revert:
	poetry run python manage.py migrate api $(mig)

#
# 📡 API - shell
#

hc:
	poetry run http GET $(base_url)/healthcheck/

list:
	poetry run http GET $(api_url)/

one:
	poetry run http GET $(api_url)/1/

post:
	poetry run http POST $(api_url)/ title=hi description="hi desc"

patch:
	poetry run http PATCH $(api_url)/1/ title=$(title)

put:
	poetry run http PUT $(api_url)/1/ title=$(title) description=$(desc)

#
# 🛰 API - browsable
#

# n.b. these URLs don't need trailing slash bc: req via Chrome, Django 301, Chrome redirect
gui-list:
	open $(api_url)/

gui-one:
	open $(api_url)/1

#
# 🖥  UI
#

repl:
	poetry run python manage.py shell_plus --bpython

admin:
	open $(base_url)/admin

#
# 📦 DEPENDENCIES
#

env:
	poetry env info

deps:
	poetry show --tree --no-dev

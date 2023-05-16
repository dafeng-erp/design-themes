.PHONY: clean clean-test clean-pyc clean-build docs help
.DEFAULT_GOAL := help

PROJECT_DIR 							:=  $(shell pwd)
ODOO_CLI								=${PROJECT_DIR}/../odoo-extra-addone/odoo-16.0/odoo-bin
ODOO_DATABASE_NAME						=odoo_dev
ODOO_DATABASE_NAME						=odoo_zirju
ODOO_CMD_MIXIN							=--addons-path='${PROJECT_DIR}/odoo-16.0/addons,${PROJECT_DIR}'  -d ${ODOO_DATABASE_NAME}
ODOO_CMD_MIXIN_CONFIG					=-c odoo-dev.conf
module									=jrizju_extra_module
define BROWSER_PYSCRIPT
import os, webbrowser, sys

from urllib.request import pathname2url

webbrowser.open("file://" + pathname2url(os.path.abspath(sys.argv[1])))
endef
export BROWSER_PYSCRIPT

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

BROWSER := python -c "$$BROWSER_PYSCRIPT"

help:
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

active-python: ## active python env
	. ${PROJECT_DIR}/../odoo-extra-addone/venv/bin/activate

create-theme: active-python ## create new theme
	${ODOO_CLI} scaffold -t theme "${theme_name}" .
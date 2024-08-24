.PHONY: help

help:
	@echo "Available targets:"
	@echo "  run-dev     - Start the development server"
	@echo "  run-prod    - Start the production server"

run-dev:
	python manage.py runserver 0.0.0.0:8000

run-prod:
	DEBUG=0 authbind poetry run gunicorn -b 0.0.0.0:80 config.wsgi

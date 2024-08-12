.PHONY: help

help:
	@echo "Available targets:"
	@echo "  run-dev     - Start the development server"

run-dev:
	python manage.py runserver 0.0.0.0:8000

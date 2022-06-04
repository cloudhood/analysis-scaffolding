init:
	@echo "Upgrading pip..."
	pip install --upgrade --user pip
	@echo "Installing venv.."
	# pip install venv
	@echo "Creating .venv..."
	python3.10 -m venv .venv
	@echo "Appending .venv to .gitignore..."
	echo "" >> .gitignore
	echo "# Virtual environment"
	echo ".venv/" >> .gitignore
	@echo "Appending .vscode to .gitignore..."
	echo "" >> .gitignore
	echo "# VS code"
	echo ".venv/" >> .gitignore
	@echo "Activating .venv and installing required packages..."
	. .venv/bin/activate &&\
		pip install --upgrade pip &&\
		pip install -r requirements.txt
	
test:
	python -m pytest -vv test_hello.py

format:
	black *.py

lint:
	pylint --disable=R,C hello.py

all: init lint test

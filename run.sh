#!/bin/bash

if [ -f ./requirements.txt ]; then
    pip install -r ./requirements.txt
fi

if [ "$FIX" = true ] ; then
    echo 'Fixing with isort and black'
    isort .
	black --line-length=79 .
fi

if [ "$CHECK" = true ] ; then
    echo 'Anayzing with isort, black, flake8, mypy and pylint'
    isort --check-only .
    black --line-length=79 --check --diff .
    flake8 --extend-exclude build/ --ignore=ANN101,ANN102,W503,W504 .
    mypy --show-column-numbers --ignore-missing-import --follow-imports=silent --exclude build .
    find . -not \( -path ./build -prune \) -not \( -path ./dist -prune \) -name "*.py" | xargs pylint --rcfile='/docker_python_linters/.pylintrc'
fi

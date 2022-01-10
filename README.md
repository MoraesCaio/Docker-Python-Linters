# Docker python linters

This image containerize the following python packages:
- isort (5.8.0)
- black (21.12b0)
- flake8 (0.930)
- flake8-annotations (3.9.2)
- mypy (2.7.0)
- pylint (2.12.2)

## How to use

First, built the image with the following command.
```bash
docker build -t docker_python_linters:latest .
```

To use the container, mount the current project inside `/data`.

The default execution only checks the code without applying changes to it.
```bash
docker run --rm -it -v $(pwd):/data docker_python_linters:latest
```

There are two steps to run (set their environment variables to `true` or
`false` to choose which steps to run):
- `FIX` uses isort and black to apply changes to the code (defaults to `false`)
- `CHECK` uses all installed linters to analyze the code (defaults to `true`)

For example, if you want to run both pipeline you can use run the container
like this:
```bash
docker run --rm -it -e FIX='true' -v $(pwd):/data docker_python_linters:latest
```

You can define pylint settings by editing the `.pylintrc` file.

## Future improvements

- Add the other linters configuration files
- Add environment variables for CLI args of each linter
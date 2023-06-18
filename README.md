# Mkdocs-Encapsulate

This tool allows you to encapsulate a Mkdocs project in a Docker container and produce and serve the website without having to install Mkdocs locally.

## Requirements

- Docker
- Bash

## Usage

```bash
# To produce the website and create a tar.gz file:
$ ./mkdockerize.sh /path/to/project produce

# To serve the website:
$ ./mkdockerize.sh /path/to/project serve

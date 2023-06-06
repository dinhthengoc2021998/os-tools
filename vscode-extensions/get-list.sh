#!/bin/bash

extensions_file=/opt/.vscode/extensions.list
code --list-extensions --show-versions | grep "@" > $extensions_file
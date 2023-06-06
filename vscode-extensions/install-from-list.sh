#!/bin/bash

extensions_file=/opt/.vscode/extensions.list
cat /opt/.vscode/extensions.list | xargs -L 1 code --install-extension
#!/bin/bash

set -e

ln -sf ../../bin/pre-commit .git/hooks/pre-commit

ln -sf ../../bin/post-merge .git/hooks/post-merge

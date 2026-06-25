#!/bin/bash

rsync -avm --include='*/' --include='RunnerResult_DefaultRefiner.json' --exclude='*' $1 $2
rsync -avm --include='*/' --include='prompt.json' --exclude='*' $1 $2

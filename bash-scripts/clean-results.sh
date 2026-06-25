#!/bin/bash

rsync -avm --include='*/' --include='RunnerResult_DefaultRefiner.json' --exclude='*' output/ jit.pocgen.gpt-4o-mini/
rsync -avm --include='*/' --include='prompt.json' --exclude='*' output/ jit.pocgen.gpt-4o-mini/

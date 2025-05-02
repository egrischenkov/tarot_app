#!/bin/bash

# There is an open issue requesting line-length formatting support for l10n.yaml:  
# https://github.com/flutter/flutter/issues/140692  
# Until Flutter addresses this, we need to exclude generated localization files  
# from formatting to prevent unnecessary changes in commits. 
find "$(dirname "$0")"/../. -type f -name "*.dart" ! -name "*.g.dart" ! -name "*.gr.dart" -print0 | xargs -0 fvm dart format -l 120


#!/bin/bash

SOURCE_DIR="output_gpt-4o-mini_cochran"
DEST_DIR="success-vs-fail/gpt-5.2/fail"

# Create destination if it doesn't exist
mkdir -p "$DEST_DIR"

folders=(
"SNYK-JS-TREEKIT-1077068"
"npm_node-simple-router_20170523"
"npm_fbr-client_20170510"
"SNYK-JS-OBJECTPATH-1569453"
"SNYK-JS-LIBNMAP-72551"
"SNYK-JS-HTMLPARSESTRINGIFY2-1079307"
"SNYK-JS-HTMLPARSESTRINGIFY-1079306"
"SNYK-JS-DECAL-1051028"
"SNYK-JS-NODEFORGE-598677"
"npm_ex-http-frame_20180226"
"npm_m-log_20160408"
"npm_modjs_20160407"
"SNYK-JS-KILLPORT-1078535"
"npm_nitro-server_20180226"
"npm_node-htmlparser-classic_20170906"
"npm_simple-mock-server_20180226"
"SNYK-JS-PAPAPARSE-564258"
"SNYK-JS-UAPARSERJS-1072471"
"npm_mobile-icon-resizer_20160408"
"SNYK-JS-DOTOBJECT-548905"
"SNYK-JS-POSTCSS-1255640"
"SNYK-JS-MOSC-571492"
"SNYK-JS-ASSIGNDEEP-450211"
"SNYK-JS-HTTPFILESERVER-451564"
"npm_node-http-server_20180226"
"npm_httpea_20180226"
"SNYK-JS-FASTCSV-1049538"
)

for folder in "${folders[@]}"; do
    if [ -d "$SOURCE_DIR/$folder" ]; then
        cp -r "$SOURCE_DIR/$folder" "$DEST_DIR/"
        echo "Copied: $folder"
    else
        echo "Missing: $folder"
    fi
done

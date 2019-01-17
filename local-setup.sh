#!/bin/bash
# Most sheets are including other sheets using the Edurep namespacing (edurep://).
# To rewrite those for local use, execute this script.
# When no argument is provided, the local development copy ends up in /tmp/local-edurep-xslt


DEFAULT_DIR="/tmp/local-edurep-xslt"
REWRITE_INCLUDES_SHEET="rewrite-includes.xsl"


LOCAL_DIR=${1%/}

if [[ "${LOCAL_DIR}" == "" ]]; then
    LOCAL_DIR=${DEFAULT_DIR}
fi

mkdir -p ${LOCAL_DIR} || exit 1

for f in $(find . -maxdepth 1 -name '*.xsl' -not -name ${REWRITE_INCLUDES_SHEET} ); do
    xsltproc ${REWRITE_INCLUDES_SHEET} ${f} > ${LOCAL_DIR}/${f}
done

# also copy all vdex mapping sheets to local dir
for f in $(find mapping-xslt -name '*.xsl'); do
    newname=$(basename ${f} | sed 's/mapping_//')
    cp ${f} ${LOCAL_DIR}/${newname}
done

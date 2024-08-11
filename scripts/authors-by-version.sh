#!/bin/bash

# Authors, comitters, co-authors
get_authors() {
    local git_tag="$1"
    shift  # Shift arguments to get the files
    local files="$@"
    git --no-pager log "$git_tag" -- $files | \
        sed -n -e 's/^Author: //p' -e 's/^Committer: //p' -e 's/^.*Co-authored-by: //p' | \
        sort | uniq | sed -e 's/^/- /'
}

# Ensure tag argument is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <git-tag>"
    exit 1
fi

GIT_TAG="$1"

if [ ! $(git tag -l "$GIT_TAG") ] && [ ! "$GIT_TAG" == "HEAD" ]; then
    echo "<git-tag> '$GIT_TAG' does not exist"
    exit 1
fi

# Check if translations
git show "$GIT_TAG":i18n > /dev/null 2>&1 && i18n=true || i18n=false


# Output
cat <<EOF
# $GIT_TAG Authors

This file is generated from Git history of the other canonical files in this repo,
and is purely a convenience for referencing in academic papers.
See the full Git history of those files for additional context.

EOF

# If translations exist, output a note about language and translations
if [ $i18n = true ]; then
    cat <<EOF
## Language and Translations

The GitOps Principles and Glossary are [authored](#authors-list) in English.
See farther below for a list of [translators](#translators-list) by language.

EOF
fi

# Get authors list
AUTHORS=$(get_authors "$GIT_TAG" "PRINCIPLES.md GLOSSARY.md")

# Append to output
cat <<EOF
## Authors List

$AUTHORS
EOF

# If translations exist, append translator lists
if [ $i18n = true ]; then
    # Get translator lists
    DE=$(get_authors "$GIT_TAG" i18n/*_de.md)
    ES=$(get_authors "$GIT_TAG" i18n/*_es.md)
    PT=$(get_authors "$GIT_TAG" i18n/*_pt.md)
    FR=$(get_authors "$GIT_TAG" i18n/*_fr.md)

    # Append to output
    cat <<EOF

## Translators List

### German

$DE

### Spanish

$ES

### Portuguese

$PT

### French

$FR
EOF
fi

#!/bin/sh -l

eccho "Show repo content"
ls -la .

echo "current branch"
echo "${REF_NAME}"

echo Reserved for REPO_NAME=${GITHUB_REPOSITORY##*/}
echo GITHUB_REF=${GITHUB_REF}
echo EXTRACT_GITHUB_REF=${GITHUB_REF##*/}
echo EXTRACT_GITHUB_REF_HEADS=$(echo ${GITHUB_REF#refs/heads/})

## Generate sha256 of the downstream repo name
#echo "Generate sha256 of the downstream repo name"
#SPLIT_DIR=$(echo -n "${INPUT_REPO}" | sha256sum)
#SPLIT_DIR="${SPLIT_DIR::-3}"
#
## Get subtree repository into split directory
#echo "Get subtree repository into split directory"
#git init --bare "${SPLIT_DIR}"
#
## Create the subtree split branch
#echo "Create the subtree split branch"
#git subtree split --prefix="${INPUT_PATH}" -b split
#
## Check for force push to remote
#echo "Check for force push to remote"
#if [ "$INPUT_FORCE" == "true" ]; then
#	PUSH_ARGS="-f"
#fi
#
## Resolve downstream branch.
## If not set then use the event github ref, if the ref isn't set default to master.
#if [ "$INPUT_BRANCH" == "" ]; then
#	if [ -z "$GITHUB_REF" ] || [ "$GITHUB_REF" == "" ]; then
#		INPUT_BRANCH="master"
#	else
#		INPUT_BRANCH="$GITHUB_REF"
#	fi
#fi
#
## Push to the subtree directory
#echo "Push to the subtree directory"
#git push "${PUSH_ARGS}" "${SPLIT_DIR}" split:"$INPUT_BRANCH"
#
#cd "${SPLIT_DIR}"
#git remote add origin subtree:"${INPUT_REPO}"
#git push -u "${PUSH_ARGS}" origin "$INPUT_BRANCH"
#
## Tag the subtree repository
#if [ "$INPUT_TAG" != "false" ]; then
#	if [ "$INPUT_TAG" == "true" ]; then
#		INPUT_TAG="${GITHUB_REF}"
#	fi
#
#	git tag $(basename "${INPUT_TAG}")
#	git push --tags
#fi
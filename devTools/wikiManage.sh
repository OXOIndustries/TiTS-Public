#!/bin/bash 

STAGE="$1"

WIKIDIR=../wiki
WEGDIR=../webDocs

if [ "$STAGE" = "setup" ]; then
	echo "Setup stage for wiki"

	if [ ! -d "$WIKIDIR" ]; then
		git clone "git@github.com:Fenoxo/sourceTiTS.wiki" ../wiki
	else
		(cd ../wiki && git pull)
		(cd ../wiki && git reset --hard HEAD)
	fi 
	
	if [ ! -d "$WEGDIR" ]; then
		git clone -b gh-pages "git@github.com:Fenoxo/sourceTiTS" ../webDocs
	else
		(cd ../webDocs && git pull)
		(cd ../webDocs && git reset --hard HEAD)

	fi
	mkdir -p "../natDocsTmp"
fi

if [ "$STAGE" = "commit" ]; then
	echo "Commit stage for wiki"
	(cd ../wiki && git add -u)
	echo "Added new files"
	(cd ../wiki && git commit -m "Automated build commited by BuildBot CoC/TiTS-Builder")
	(cd ../wiki && git push)

	echo "Commit stage for Pages"
	(cd ../webDocs && git add -u)
	(cd ../webDocs && git add *)
	echo "Added new files"
	(cd ../webDocs && git commit -m "Automated build commited by BuildBot CoC/TiTS-Builder")
	(cd ../webDocs && git push)

fi

echo "Complete"
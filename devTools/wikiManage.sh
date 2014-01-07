#!/bin/bash 

STAGE="$1"

DIRECTORY=../wiki

if [ "$STAGE" = "setup" ]; then
	echo "Setup stage for wiki"

	if [ ! -d "$DIRECTORY" ]; then
		git clone "git@github.com:Fenoxo/sourceTiTS.wiki" ../wiki
	else
		(cd ../wiki && git pull)
		(cd ../wiki && git reset --hard HEAD)

	fi

fi

if [ "$STAGE" = "commit" ]; then
	echo "Commit stage for wiki"
	(cd ../wiki && git add -u)
	(cd ../wiki && git commit -m "Automated build commited by BuildBot CoC/TiTS-Builder")
	(cd ../wiki && git push)

fi

echo "Complete"
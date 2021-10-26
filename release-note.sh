#!/bin/bash

print_usage()
{
	echo "Usage:"
        echo "Get the release note from last tag to HEAD:"
        echo "$(basename "$0")"
        echo ""
        echo "Get the release note between 2 tags:"
        echo "$(basename "$0") -f <from tag> -t <to tag>"
}

while getopts 'hf:t:' option; do
	case "$option" in
		h) print_usage 
		exit 0
		;;
		f) fromTag=$OPTARG
		;;
		t) toTag=$OPTARG
		;;
		\?) echo "Illegal option"
		print_usage
		exit 1
		;;
esac
done
shift $((OPTIND -1))

git fetch --all --tags 1>/dev/null 2>&1
#git show-ref HEAD -s
if [ -z "${fromTag}" ]; then
	fromTag=$(git describe --tags $(git rev-list --tags --max-count=1))
fi

if [ -z "${toTag}" ]; then
	toTag="HEAD"
fi

echo "Generating Release note between ${fromTag} to ${toTag}..."

output='ReleaseNote.MD'

echo "# Release Note" > ${output}
echo "" >> ${output}

echo "## From ${fromTag} to ${toTag}" >> ${output}
echo "" >> ${output}

logs="$(git log --pretty='%h - %s (%an)' ${fromTag}..${toTag})"

fixCommits=$(echo "${logs}"|grep -Ei "^[a-z0-9]{9} - fix(\\(.*\\))?:")
featCommits=$(echo "${logs}"|grep -Ei "^[a-z0-9]{9} - feat(\\(.*\\))?:")
choreCommits=$(echo "${logs}"|grep -Ei "^[a-z0-9]{9} - chore(\\(.*\\))?:")
docsCommits=$(echo "${logs}"|grep -Ei "^[a-z0-9]{9} - docs(\\(.*\\))?:")
styleCommits=$(echo "${logs}"|grep -Ei "^[a-z0-9]{9} - style(\\(.*\\))?:")
refactorCommits=$(echo "${logs}"|grep -Ei "^[a-z0-9]{9} - refactor(\\(.*\\))?:")
perfCommits=$(echo "${logs}"|grep -Ei "^[a-z0-9]{9} - perf(\\(.*\\))?:")
testCommits=$(echo "${logs}"|grep -Ei "^[a-z0-9]{9} - test(\\(.*\\))?:")
ciCommits=$(echo "${logs}"|grep -Ei "^[a-z0-9]{9} - ci(\\(.*\\))?:")

if [ "${fixCommits}" != "" ]; then
	echo "### Bug Fixes" >> ${output}
	echo "${fixCommits}" >> ${output}
	echo "">>${output}
fi

if [ "${featCommits}" != "" ]; then
        echo "### Features" >> ${output}
        echo "${featCommits}" >> ${output}
        echo "">>${output}
fi

if [ "${choreCommits}" != "" ]; then
        echo "### Configuration" >> ${output}
        echo "${choreCommits}" >> ${output}
        echo "">>${output}
fi

if [ "${docsCommits}" != "" ]; then
        echo "### Documentation" >> ${output}
        echo "${docsCommits}" >> ${output}
        echo "">>${output}
fi

if [ "${styleCommits}" != "" ]; then
        echo "### Style" >> ${output}
        echo "${styleCommits}" >> ${output}
        echo "">>${output}
fi

if [ "${refactorCommits}" != "" ]; then
        echo "### Refactor" >> ${output}
        echo "${refactorCommits}" >> ${output}
        echo "">>${output}
fi

if [ "${perfCommits}" != "" ]; then
        echo "### Performance" >> ${output}
        echo "${perfCommits}" >> ${output}
        echo "">>${output}
fi

if [ "${testCommits}" != "" ]; then
        echo "### Tests" >> ${output}
        echo "${testCommits}" >> ${output}
        echo "">>${output}
fi

if [ "${ciCommits}" != "" ]; then
        echo "### Continuous Integration" >> ${output}
        echo "${ciCommits}" >> ${output}
        echo "">>${output}
fi

echo '.~~~~.'
echo 'i====i_'
echo '|cccc|_)'
echo '|cccc|'
echo '`-==-'


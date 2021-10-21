#!/bin/bash

last_tag='HEAD'
previous_tag='41.0.0.181'
output='ReleaseNote.MD'

echo "# Release Note" > ${output}
echo "" >> ${output}

echo "## ${last_tag}" >> ${output}
echo "" >> ${output}

logs=$(git log --pretty="%h - %s (%an)" ${previous_tag}..${last_tag})

fixCommits=$(echo "${logs}"|grep -i " - fix:")
featCommits=$(echo "${logs}"|grep -i " - feat:")
choreCommits=$(echo "${logs}"|grep -i " - chore:")
docsCommits=$(echo "${logs}"|grep -i " - docs:")
styleCommits=$(echo "${logs}"|grep -i " - style:")
refactorCommits=$(echo "${logs}"|grep -i " - refactor:")
perfCommits=$(echo "${logs}"|grep -i " - perf:")
testCommits=$(echo "${logs}"|grep -i " - test:")
ciCommits=$(echo "${logs}"|grep -i " - ci:")

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

#!/bin/bash

last_tag='HEAD'
previous_tag='41.0.0.181'
output='ReleaseNote.MD'

echo "# Release Note" > ${output}
echo "" >> ${output}

echo "## ${last_tag}" >> ${output}
echo "" >> ${output}

logs=`git log --pretty="%h - %s (%an)" ${previous_tag}..${last_tag}`

echo "### Bug Fixes" >> ${output}
echo "${logs}" | grep -i " - fix:" >> ${output}
echo "">>${output}

echo "### Features" >> ${output}
echo "${logs}" | grep -i " - feat:" >> ${output} 
echo "">>${output}

echo "### Chore" >> ${output}
echo "${logs}" | grep -i " - chore:" >> ${output}
echo "">> ${output}

echo "### Docs" >> ${output}
echo "${logs}" | grep -i " - docs:" >> ${output}
echo "">> ${output}

echo "### Style" >> ${output}
echo "${logs}" | grep -i " - style:" >> ${output}
echo "">> ${output}

echo "### Refactor" >> ${output}
echo "${logs}" | grep -i " - refactor:" >> ${output}
echo "">> ${output}

echo "### Performance" >> ${output}
echo "${logs}" | grep -i " - perf:" >> ${output}
echo "">> ${output}

echo "### Test" >> ${output}
echo "${logs}" | grep -i " - test:" >> ${output}
echo "">> ${output}

echo "### Continuous Integration" >> ${output}
echo "${logs}" | grep -i " - ci:" >> ${output}
echo "">> ${output}

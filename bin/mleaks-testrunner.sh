#!/bin/bash

# On success the test launcher creates the $TESTRESULT_FILE
# This is required for make to detect test failures.

TEST_BIN=$1
TESTRESULT_FILE=${TEST_BIN}.testresult

# --dsymutil=yes is required to get line numbers (only on OSX ?)
# see http://stackoverflow.com/questions/1221833/bash-pipe-output-and-capture-exit-status
${TEST_BIN} 2>&1 | tee >(grep -v ^__MEMDBG > /dev/stderr) | grep __MEMDBG | mleaks

RESULT=$?
[ $RESULT -eq 0 ] && touch $TESTRESULT_FILE
exit $RESULT
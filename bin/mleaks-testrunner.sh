#!/bin/bash

# On success the test launcher creates the $TESTRESULT_FILE
# This is required for make to detect test failures.

# see http://unix.stackexchange.com/questions/14270/get-exit-status-of-process-thats-piped-to-another/73180#73180
# see http://www.tldp.org/LDP/abs/html/internalvariables.html

TEST_BIN=$1
TESTRESULT_FILE=${TEST_BIN}.testresult

${TEST_BIN} 2>&1 | tee >(grep -v ^__MEMDBG > /dev/stderr) | grep __MEMDBG | mleaks

# use PIPESTATUS (bash specific) to capture the status of each command in the pipe.
# $PIPESTATUS is a "volatile" variable and needs to be captured immediately.
status="${PIPESTATUS[@]}"
#echo "PIPESTATUS: $status"

# pipe status string: "<test binary> <tee> <grep> <mleaks>"
STATUS_OK="0 0 0 0"

# grep returns 1 when no lines where selected (when no memory was allocated)
STATUS_NO_MEMDBG="0 0 1 0"

if [ "$status" = "$STATUS_OK" ] || [ "$status" = "$STATUS_NO_MEMDBG" ]
then
    touch $TESTRESULT_FILE
    exit 0
fi

exit 1

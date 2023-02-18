#!/bin/sh

# runtest.sh -- runs test and checks the results
#
# Roger B. Dannenberg
# Feb 2023

# the output file is long so we're going to check the checksum rather than
# actual file.

if test -f "portsmf_test"; then
    echo "Running portsmf_test ..."
else
    echo "You must run this test in the directory containing the"
    echo "executable: portsmf_test."
    exit 1
fi

./portsmf_test > portsmf_test.out
echo "Computing checksum on portsmf_test.out ..."
checksum="$(cksum portsmf_test.out)"
echo "    $checksum"
goodoutput="2757809362 58638 portsmf_test.out"
if [ "$checksum" = "$goodoutput" ]; then
    echo "    Checksum is GOOD"
else
    echo "    Checksum is BAD"
    echo "Something has changed in portsmf or portsmf_test. You should"
    echo "use an older version that passes this test, save the output"
    echo "of portsmf_test, and look for differences to see if something"
    echo "is broken in this version."
fi

echo "Computing checksum on before-33.alg ..."
checksum="$(cksum before-33.alg)"
echo "    $checksum"
goodoutput="3028993614 270689 before-33.alg"
if [ "$checksum" = "$goodoutput" ]; then
    echo "    Checksum is GOOD"
else
    echo "    Checksum is BAD"
    echo "Something has changed in portsmf or portsmf_test. You should"
    echo "compare before-33.alg from an earlier version to before-33.alg"
    echo "from this version to find out why they are different."
fi

echo "Computing checksum on after-33.alg ..."
checksum="$(cksum after-33.alg)"
echo "    $checksum"
goodoutput="602137182 268292 after-33.alg"
if [ "$checksum" = "$goodoutput" ]; then
    echo "    Checksum is GOOD"
else
    echo "    Checksum is BAD"
    echo "Something has changed in portsmf or portsmf_test. You should"
    echo "compare after-33.alg from an earlier version to after-33.alg"
    echo "from this version to find out why they are different."
fi

echo "Comparing bigseq1.alg and bigseq2.alg (should be identical)..."

if cmp -s bigseq1.alg bigseq2.alg; then
    echo "    Files are the same - GOOD"
else
    echo "    Files differ - BAD"
    echo "Something has changed in portsmf or portsmf_test. You should"
    echo "inspect bigseq1.alg and bigseq2.alg to find out why they are"
    echo "different."
fi

echo "Done."


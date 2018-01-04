#! /bin/sh

OUTDIR=build/html

OUTPUT=out.html
INPUT=$(cat inputs.txt)

rm -f src/$OUTPUT
rm -rf $OUTDIR
mkdir -p $OUTDIR

cd src \
&& pandoc --read markdown --write html --toc \
	--include-in-header=../headers.html --mathjax -s \
	-o ../$OUTDIR/$OUTPUT \
	$INPUT \
&& cp *.png ../$OUTDIR

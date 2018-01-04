#! /bin/sh

OUTDIR=build/pdf

OUTPUT=out.tex
INPUT=$(cat inputs.txt)

rm -f src/$OUTPUT
rm -rf $OUTDIR
mkdir -p $OUTDIR

cd src \
&& pandoc --read markdown --write latex --toc \
	--include-in-header=../headers.tex -s -o $OUTPUT \
	$INPUT \
&& latexmk -pdf -output-directory=../$OUTDIR \
&& rm $OUTPUT

#! /bin/sh

OUTDIR=build

OUTPUT=out.tex
INPUT=$(cat <<END_OF_INPUT
chap1.md
chap2.md
chap3.md
END_OF_INPUT)

rm -f src/$OUTPUT
rm -rf $OUTDIR
mkdir -p $OUTDIR

cd src \
&& pandoc --read markdown --write latex --toc \
	--include-in-header=../headers.tex -s -o $OUTPUT \
	$INPUT \
&& latexmk -pdf -output-directory=../$OUTDIR

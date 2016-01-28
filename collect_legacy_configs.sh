#!/bin/bash

PRODUCTS="python swig flask twisted scons numpy protobuf matplotlib pyyaml sqlalchemy requests"

REPOROOT="https://github.com/LSST"
UPS="ups.new"

mkdir -p "$UPS"

rm -rf tmp
for prod in $PRODUCTS; do
	git clone --depth=1 "$REPOROOT/$prod" tmp
	cp -a tmp/ups/*.{table,cfg} "$UPS"
	rm -rf tmp
done

# Add anaconda.table by hand
touch "$UPS"/anaconda.table

mv ups ups.old
mv "$UPS" ups
rm -rf ups.old

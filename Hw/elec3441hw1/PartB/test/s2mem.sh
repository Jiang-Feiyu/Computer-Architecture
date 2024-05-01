#!/bin/bash
#
# Author: Hayden So
# Date  : 20140303
# Note  : Simple script to generate hex output suitable for Logisim.  It takes 1 single .S file and compile it using riscv-as and riscv-ld.  Output is in the begining of .text section
# Parameter : @assembly_input
#
#
#
############################################################

TEXTBEGIN=0x0
DATABEGIN=0xA00

############################################################
if [ ! $# -eq 1 ] && [ ! $# -eq 3 ] ; then
    echo "$0 [-e entry] <input>"
    exit 1
fi

entrypoint=_start
if [ $# -eq 3 ] ; then
    if [ ! "$1" = "-e" ] ; then
	echo "Unknown option $1"
	exit 1
    fi
    entrypoint=$2
    fname=$3
else
    fname=$1
fi

if [ ! -f $fname ] ; then
    echo "ERROR: Input file $fname does not exist"
    exit 1
fi

fbname=$(basename $fname)
fbname=${fbname%.*}

CC_PREFIX=riscv64-unknown-elf-
RISCV_ARCH="-march=rv32i -mabi=ilp32"

echo "Compiling: $fname ..."

${CC_PREFIX}gcc -c -O2 ${fname} -o ${fbname}.o ${RISCV_ARCH} && \
${CC_PREFIX}ld -s ${fbname}.o -melf32lriscv -Ttext=0x0 -e ${entrypoint} -o ${fbname}.elf

echo "Compilation Done. Now Generate Logisim memory dump... "

${CC_PREFIX}objcopy --only-section=.text ${fbname}.elf --output-target binary ${fbname}.text
${CC_PREFIX}objcopy --only-section=.data ${fbname}.elf --output-target binary ${fbname}.data

echo "v2.0 raw" > ${fbname}.mem
hexdump -v -e '/4 "%08X\n"' ${fbname}.text >> ${fbname}.mem

TEXT_LEN=`hexdump -v -e '/4 "%08X\n"' ${fbname}.text | wc -l`
DATA_LEN=`hexdump -v -e '/4 "%08X\n"' ${fbname}.data | wc -l`


if [ "$DATA_LEN" -gt "0" ] ; then
    while [ $TEXT_LEN -lt $(($DATABEGIN >> 2)) ] ; do
        echo "00000000" >> ${fbname}.mem
        TEXT_LEN=$(($TEXT_LEN + 1))
    done
    hexdump -v -e '/4 "%08X\n"' ${fbname}.data >> ${fbname}.mem
fi
	
rm -f  ${fbname}.o ${fbname}.elf ${fbname}.data ${fbname}.text

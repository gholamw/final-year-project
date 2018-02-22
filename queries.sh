#!/bin/bash


. port-setup.sh

if [ "$PORTSETUPDONE" != "y" ]
then
    echo "Bad port setup - check that out"
    exit 1
fi

dig txt @$STUBIP -p $STUBPORT _wessam.responsible.ie
dig txt @$STUBIP -p $STUBPORT _wessam.responsible.ie
dig txt @$STUBIP -p $STUBPORT _wessam.responsible.ie


dig @$STUBIP -p $STUBPORT irishrail.ie
dig @$STUBIP -p $STUBPORT irishrail.ie

dig @$STUBIP -p $STUBPORT tcd.ie
dig @$STUBIP -p $STUBPORT tcd.ie

dig txt @$STUBIP -p $STUBPORT _wessam.responsible.ie
sleep 5
dig txt @$STUBIP -p $STUBPORT _wessam.responsible.ie
dig txt @$STUBIP -p $STUBPORT _wessam.responsible.ie

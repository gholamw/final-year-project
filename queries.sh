#!/bin/bash


. ./port-setup.sh

if [ "$PORTSETUPDONE" != "y" ]
then
    echo "Bad port setup - check that out"
    exit 1
fi

python start_timing.py
dig txt @$STUBIP -p $STUBPORT _wessam.responsible.ie
python end_timing.py

python start_timing.py
dig txt @$STUBIP -p $STUBPORT _wessam.responsible.ie
python end_timing.py

python start_timing.py
dig txt @$STUBIP -p $STUBPORT _wessam.responsible.ie
python end_timing.py

python start_timing.py
dig @$STUBIP -p $STUBPORT irishrail.ie
python end_timing.py

python start_timing.py
dig @$STUBIP -p $STUBPORT irishrail.ie
python end_timing.py

python start_timing.py
dig @$STUBIP -p $STUBPORT tcd.ie
python end_timing.py

python start_timing.py
dig @$STUBIP -p $STUBPORT tcd.ie
python end_timing.py

python start_timing.py
dig txt @$STUBIP -p $STUBPORT _wessam.responsible.ie
python end_timing.py

sleep 5

python start_timing.py
dig txt @$STUBIP -p $STUBPORT _wessam.responsible.ie
python end_timing.py

python start_timing.py
dig txt @$STUBIP -p $STUBPORT _wessam.responsible.ie
python end_timing.py

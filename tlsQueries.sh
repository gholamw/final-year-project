#!/bin/bash

. port-setup.sh

python start_timing.py
dig txt @STUBIPTLS -p STUBPORT _wessam.responsible.ie
python end_timing.py

python start_timing.py
dig txt @STUBIPTLS -p STUBPORT _wessam.responsible.ie
python end_timing.py

python start_timing.py
dig txt @STUBIPTLS -p STUBPORT _wessam.responsible.ie
python end_timing.py

python start_timing.py
dig @STUBIPTLS -p STUBPORT irishrail.ie
python end_timing.py

python start_timing.py
dig @STUBIPTLS -p STUBPORT irishrail.ie
python end_timing.py

python start_timing.py
dig @STUBIPTLS -p STUBPORT tcd.ie
python end_timing.py

python start_timing.py
dig @STUBIPTLS -p STUBPORT tcd.ie
python end_timing.py

python start_timing.py
dig txt @STUBIPTLS -p STUBPORT _wessam.responsible.ie
python end_timing.py

sleep 5

python start_timing.py
dig txt @STUBIPTLS -p STUBPORT _wessam.responsible.ie
python end_timing.py

python start_timing.py
dig txt @STUBIPTLS -p STUBPORT _wessam.responsible.ie
python end_timing.py

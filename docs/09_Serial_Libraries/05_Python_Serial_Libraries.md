Python serial libraries for UDOO DUAL/QUAD
------------

This file describes how to run the python examples contained in this folder.

1 - Starting from UDOObuntu 2 all the libraries and link should be preinstalled. Otherwise install the Python serial library:

  sudo apt-get install python-serial

2 - Create the needed serial link with these commands:

  sudo ln -s /dev/ttymxc3 /dev/ttyS0

3 - Open a terminal and navigate to this folder:

  cd serial_libraries_examples/python/

4 - Run the python program:

for the base python_serial_example.py:

  python python_serial_example.py

for the bidirectional python_serial_example_bidirectional.py:

  python python_serial_example_bidirectional.py

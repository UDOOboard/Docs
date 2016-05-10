## Internal Arduino IDE
To develop sketches for SAM3X cores we provide the same way to program Arduino DUE. We can use the internal Arduino IDE preinstalled on the UDOObuntu releases.

After you connected the board and you boot the UDOObuntu 2 desktop environment:

1. Start -> Programming -> Arduino IDE or the Arduino IDE desktop link.
2. Tools -> Board -> UDOO QDL (Arduino Due)
3. Tools -> Port -> /dev/ttymxc3
4. File -> Examples -> Basics -> Blink
5. Click on "Upload" button.
6. Wait "Compiling sketch..." until "Uploadin complete".

As you can see this is the same procedure you usually use with all the others Arduino board.

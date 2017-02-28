From *Wikipedia*:

> The [Serial Peripheral Interface bus][wiki] (SPI) is a synchronous serial
> communication interface specification used for short distance communication,
> primarily in embedded systems. The interface was developed by Motorola and has
> become a de facto standard. Typical applications include sensors, Secure
> Digital cards, and liquid crystal displays.
> 
> SPI devices communicate in full duplex mode using a master-slave architecture
> with a single master. The master device originates the frame for reading and
> writing. Multiple slave devices are supported through selection with individual
> slave select (SS) lines.

[wiki]: https://en.wikipedia.org/wiki/Serial_Peripheral_Interface_Bus

## ECSPI 

From the **NXP** [iMX 6 Quad/Dual Reference Manual][imx6qdlrf]:

> The *Enhanced Configurable Serial Peripheral Interface (ECSPI)* is a
> full-duplex, synchronous, four-wire serial communication block.  The ECSPI
> contains a 64 x 32 receive buffer (RXFIFO) and a 64 x 32 transmit buffer
> (TXFIFO). With data FIFOs, the ECSPI allows rapid data communication with fewer
> software interrupts. The figure below shows a block diagram of the ECSPI.
> 
> Key features of the ECSPI include:
> * Full-duplex synchronous serial interface
> * Master/Slave configurable
> * Four Chip Select (SS) signals to support multiple peripherals
> * Transfer continuation function allows unlimited length data transfers
> * 32-bit wide by 64-entry FIFO for both transmit and receive data
> * Polarity and phase of the Chip Select (SS) and SPI Clock (SCLK) are configurable
> * Direct Memory Access (DMA) support
> * Max operation frequency up to the reference clock frequency.
> 
> The ECSPI supports the modes described in the indicated sections:
> * Master Mode
> * Slave Mode
> * Low Power Modes

For more detailed information look at the Chapter 21 of the [iMX 6 Quad/Dual Reference Manual][imx6qdlrf]

[imx6qdlrf]: http://www.nxp.com/files/32bit/doc/ref_manual/IMX6DQRM.pdf

## UDOO QUAD/DUAL SPI channels

UDOO QUAD/DUAL exposes 2 **ECSPI** channels:

|         | MISO | MOSI | CLOCK | SS0   | SS1 | SS2 | SS3 |
|---------|------|------|-------|-------|-----|-----|-----|
| ECSPI_1 | 45   | 37   | 36    | 46    | 31  | 53  | 47  |
| ECSPI_2 | 50   | 51   | 52    | 34    | 31  | 53  | 47  |
| ECSPI_5 |  3   |  5   |  2    |  4    |  9  |  8  |  -  |

By default the SPI buses are not enabled and their pins are configured as GPIO. In order to enable
ECSPI, follow this [guide](!Cookbook_Linux/Device_Tree_Editor).

### ECSPI 1
ECSPI 1 is a full SPI, including Select Signals (SS0, SS1, SS2).

### ECSPI 2
ECSPI 2 is a full SPI, including Select Signals (SS0, SS1, SS2).

### ECSPI 5
ECSPI 5 has only six signals exposed (MISO, MOSI, SCLK, SS0, SS1, SS2), and
many of them are shared with *SD1*.

## Use
SPI is used by many sensor chips, flash memories, displays and other
perifericals following a master-slave with a single master. **UDOO QUAD/DUAL**
supports master mode only on its *Enhanced Configurable SPI* (ECSPI).
The protocol consist of four main signals: 

* __MISO__: Master Input Slave Output
* __MOSI__: Master Output Slave Input
* __SCLK__: Serial Clock
* __SS__: Slave Select

If you want to simply use it from a user application, just enable the
**ecspi{X}** peripherical from the *Device Tree Editor* and use the **spidev**
module to interact with it.
In order to reduce conficts with other devices, SPI buses enabled from the
*Device Tree Editor* have only SS0 signal as chip select.

### Example
From [Linux-Sunxi][sunxi] website:

[sunxi]: http://linux-sunxi.org/SPIdev

```cpp
char *buffer;
char buf[10];

file=spi_init("/dev/spidev0.0"); //dev

buf[0] = 0x41;
buf[1] = 0xFF;
spi_write(0xE6,0x0E,2,buf,file); //this will write value 0x41FF to the address 0xE60E

buffer=(char *)spi_read(0xE6,0x0E,4,file); //reading the address 0xE60E

close(file);
```

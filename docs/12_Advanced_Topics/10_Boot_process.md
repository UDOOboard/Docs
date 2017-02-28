When the board is powered on, the CPU executes code in its internal ROM, loading the first sectors of the SD card. In this way the [U-Boot boot-loader](https://github.com/UDOOboard/uboot-imx) is loaded and executed.

## The boot-loader

This thin layer of software takes care of initialize some registers, devices (like the PMIC) and RAM time settings. It is composed of two stages, the first is called SPL (secondary program loader) which [initializes several things](https://github.com/UDOOboard/uboot-imx/blob/2015.04.imx-neo/board/udoo/neo/spl.c#L147):

 * [`arch_cpu_init()`](https://github.com/UDOOboard/uboot-imx/blob/2015.04.imx-neo/arch/arm/cpu/armv7/mx6/soc.c#L421) initializes some registers, the watchdog, the DMA, etc;
 * [`ccgr_init`](https://github.com/UDOOboard/uboot-imx/blob/2015.04.imx-neo/board/udoo/neo/spl.c#L100) initializes CCGR registers in the CCM (Clock Controller Module);
 * [`board_early_init_f`](https://github.com/UDOOboard/uboot-imx/blob/2015.04.imx-neo/board/udoo/neo/neo.c#L721) initializes the M4 core and the pads of the UART1;
 * [`timer_init`](https://github.com/UDOOboard/uboot-imx/blob/2015.04.imx-neo/arch/arm/imx-common/timer.c#L95) initializes CPU timers and clock sources;
 * [`preloader_console_init`](https://github.com/UDOOboard/uboot-imx/blob/2015.04.imx-neo/common/spl/spl.c#L281) initializes serial port communications and prints the message "*U-Boot SPL 2015.04-00267-gd781468 (Dec 16 2015 - 14:44:56)*";
 * [`spl_dram_init`](https://github.com/UDOOboard/uboot-imx/blob/2015.04.imx-neo/board/udoo/neo/spl.c#L114) sets board-specific DRAM configuration (UDOO Neo Basic has 512MB of RAM and different timings);
 * [`memset`](https://github.com/UDOOboard/uboot-imx/blob/2015.04.imx-neo/board/udoo/neo/spl.c#L167) zeros BSS memory;
 * [`board_init_r`](https://github.com/UDOOboard/uboot-imx/blob/2015.04.imx-neo/common/spl/spl.c#L151) continues the boot, loading the second stage of the boot-loader.

In the [second stage](https://github.com/UDOOboard/uboot-imx/blob/2015.04.imx-neo/board/udoo/neo/neo.c), more devices and registers are initialized. I2C buses, LVDS, Ethernet, Wireless and motions sensors pads are initialized. The PFUZE3000 power regulator is [setup](https://github.com/UDOOboard/uboot-imx/blob/2015.04.imx-neo/board/udoo/neo/neo.c#L489) and MMC is [initialized](https://github.com/UDOOboard/uboot-imx/blob/2015.04.imx-neo/board/udoo/neo/neo.c#L787) so files can be read from it.


## The uEnv.txt file

Once the hardware is correctly initialized, the `uEnv.txt` file is read from the FAT `/boot` partition. This file contains a few options to override some default settings, like the main video output (which defaults to HDMI).

| Variable name    | Default value   | Possible values             |
|------------------|-----------------|-----------------------------|
| `video_output`   | `hdmi`          | `hdmi`, `lvds7`, `disabled` |
| `m4_enabled`     | `true`          | `true`, `false`             |
| `use_custom_dtb` | `false`         | `true`, `false`             |

Those variables (screen type, M4 core status and the use of [custom device tree](!Cookbook_Linux/Device_Tree_Editor)) are used to [select](https://github.com/UDOOboard/uboot-imx/blob/2015.04.imx-neo/board/udoo/neo/neo.c#L1129) the correct device tree file to load.


## Linux kernel boot

The last step is to load the Linux kernel `zImage` and the device tree file, both from the `/boot` partition:

```
reading /zImage
4376112 bytes read in 232 ms (18 MiB/s)
Booting from mmc ...
reading dts-overlay/imx6sx-udoo-neo-full-hdmi-m4.dtb
45210 bytes read in 35 ms (1.2 MiB/s)
Kernel image @ 0x80800000 [ 0x000000 - 0x42c630 ]
## Flattened Device Tree blob at 83000000
   Booting using the fdt blob at 0x83000000
   Using Device Tree in place at 83000000, end 8300e099
Switched to ldo_bypass mode!

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 3.14.56-udooneo-01989-.....
```


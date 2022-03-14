# VLSI-Project
4-bit CLA layout with inputs and outputs passed through D flip-flops, designed with MAGIC-VLSI tool.

To run on windows:
* Install Ubuntu(18.04 LTS) from the store.
* Install the MAGIC package with the Linux shell(Shift+Rclick).
* Install and launch Xming X-Server for Windows.
* Open Linux shell at the location of the .mag files.
* `magic -T SCN6M_DEEP.09.tech27 cla+dff.mag`
* To extract spice netlist, run `extract all` and `ext2spice -c file_name.ext` in MAGIC's console.

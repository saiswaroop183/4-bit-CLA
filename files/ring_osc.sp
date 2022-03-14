.include TSMC_180nm.txt
.param SUPPLY = 1.8
.param LAMBDA = 0.18u
.param width_N = {10*LAMBDA}
.param width_P = {2.5*width_N}
.global gnd vdd


VDS vdd gnd 'SUPPLY'

.subckt INV in out
M1 out in vdd vdd CMOSP W={width_P} L={LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

M2 out in gnd gnd CMOSN W={width_N} L={LAMBDA}
+ AS = {5*width_N*LAMBDA} PS = {10*LAMBDA + 2*width_N} AD = {5*width_N*LAMBDA} PD = {10*LAMBDA +2*width_N}

.ends INV

XA1 a b INV
XA2 b c INV
XA3 c d INV
XA4 d e INV
XA5 e a INV

.tran 10p 5n
.measure tran tdelay
+ TRIG v(a) VAL = 'SUPPLY/2'  RISE = 1
+ TARG v(a) VAL = 'SUPPLY/2' FALL = 1

.control
run
plot v(a)

.endc
.end

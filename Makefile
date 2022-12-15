rtl = ./rtl/drink_moore.v
tb = ./tb/drink_moore_tb.v

all: com sim

com:
	vcs -full64  -debug_all $(tb) $(rtl) -l com.log 
	#vcs -full64  -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed -sverilog -fsdb -debug_all $(tb) $(rtl) -l com.log
sim:
	./simv -gui -l sim.log

run:
	dve -vpd vcdplus.vpd &

clean:
	rm -rf *.log csrc simv* *.key *.vpd DVEfiles coverage *.vdb verdi* *.out *.conf *.fsdb
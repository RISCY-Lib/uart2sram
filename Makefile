
include $(PROJ_PATH)/testbench/testbench.mk

_SV_SOURCE := $(filter %.sv, $(SOURCE))
_SV_ANALYZED := $(patsubst %.sv, .analyze_sv.%, $(notdir $(_SV_SOURCE)))

VPATH = $(dir $(SOURCE))

sim: .xelab
	@echo "Simulating..."
	@echo SOURCE:       $(SOURCE)
	@echo _SV_SOURCE:   $(_SV_SOURCE)
	@echo _SV_ANALYZED: $(_SV_ANALYZED)
	@echo VPATH:        $(VPATH)

compile: .xelab

.xelab: xsim.dir/work.test_top
	@touch $@

xsim.dir/work.test_top: $(_SV_ANALYZED)
	xelab -sv test_top -L uvm

.analyze_sv.%: %.sv
	xvlog -sv $< -L uvm
	@touch $@
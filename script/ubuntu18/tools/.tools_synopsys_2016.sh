# synopsys
export SYNOPSYS=/tools/synopsys
# vcs
export VCS_HOME=$SYNOPSYS/vcs-2016.06
export DVE_HOME=$VCS_HOME/gui/dve
export PATH=$PATH:$DVE_HOME/bin:$VCS_HOME/bin
# verdi
export VERDI_HOME=$SYNOPSYS/Verdi3_L-2016.06-1
export NOVAS_HOME=$SYNOPSYS/Verdi3_L-2016.06-1
export FSDB_HOME=$VERDI_HOME/share/PLI/VCS/LINUX64
export PATH=$PATH:$VERDI_HOME/bin:$VERDI_HOME/platform/LINUX64/64
export LD_LIBRARY_PATH=$NOVAS_HOME/share/PLI/VCS/LINUX64
# uvm
export UVM_HOME=/tools/synopsys/uvm-1.1a
# spyglass
export SPYGLASS_HOME=/tools/synopsys/SpyGlass-L2016.06/SPYGLASS_HOME
export PATH=$PATH:$SPYGLASS_HOME/bin
# dc
export DC_HOME=/tools/synopsys/dc_L-2016.03-SP1
export PATH=$PATH:$DC_HOME/bin
alias dc='dc_shell &'
alias dv='design_vision &'
alias dt='dc_shell-t &'
# icc
export ICC_HOME=/tools/synopsys/icc_L-2016.03-SP1
export PATH=$PATH:$ICC_HOME/bin
# pt
export PT_HOME=/tools/synopsys/pt_M-2016.12-SP1
export PATH=$PATH:$PT_HOME/bin
alias pt='primetime &'
# formality
export FM_HOME=/tools/synopsys/fm_L-2016.03-SP1
export PATH=$PATH:$FM_HOME/bin
alias fm='fm_shell &'
# scl
export SCL_HOME=$SYNOPSYS/scl_11.9
export PATH=$PATH:$SCL_HOME/amd64/bin
# license
export SNPSLMD_LICENSE_FILE=27000@$HOSTNAME
export LM_LICENSE_FILE=27000@$HOSTNAME
export VCS_ARCH_OVERIDE=linux
export VCS_TARGET_ARCH=amd64
# app
alias vcs64="vcs -full64"
alias verdi64="verdi -full64 &"
alias dve64="dve -full64 &"
alias lmli2="lmgrd -c $SYNOPSYS/Synopsys.dat"


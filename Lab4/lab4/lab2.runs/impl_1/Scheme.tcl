# 
# Report generation script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config  -ruleid {1}  -id {Place 30-574}  -string {{ERROR: [Place 30-574] Poor placement for routing between an IO pin and BUFG. If this sub optimal condition is acceptable for this design, you may use the CLOCK_DEDICATED_ROUTE constraint in the .xdc file to demote this message to a WARNING. However, the use of this override is highly discouraged. These examples can be used directly in the .xdc file to override this clock rule.
	< set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets pushbuttons_IBUF[4]] >

	pushbuttons_IBUF[4]_inst (IBUF.O) is locked to IOB_X1Y110
	 and pushbuttons_IBUF_BUFG[4]_inst (BUFG.I) is provisionally placed by clockplacer on BUFGCTRL_X0Y0
Resolution: Poor placement of an IO pin and a BUFG has resulted in the router using a non-dedicated path between the two.  There are several things that could trigger this DRC, each of which can cause unpredictable clock insertion delays that result in poor timing.  This DRC could be caused by any of the following: (a) a clock port was placed on a pin that is not a CCIO-pin (b)the BUFG has not been placed in the same half of the device or SLR as the CCIO-pin (c) a single ended clock has been placed on the N-Side of a differential pair CCIO-pin.}}  -suppress 
set_msg_config  -ruleid {2}  -id {Place 30-99}  -string {{ERROR: [Place 30-99] Placer failed with error: 'IO Clock Placer failed'
Please review all ERROR, CRITICAL WARNING, and WARNING messages during placement to understand the cause for failure.}}  -suppress 

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  create_project -in_memory -part xc7a200tfbg676-2
  set_property board_part xilinx.com:ac701:part0:1.4 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/Users/vlad/Desktop/lab2/lab2.cache/wt [current_project]
  set_property parent.project_path C:/Users/vlad/Desktop/lab2/lab2.xpr [current_project]
  set_property ip_output_repo C:/Users/vlad/Desktop/lab2/lab2.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  add_files -quiet C:/Users/vlad/Desktop/lab2/lab2.runs/synth_1/Scheme.dcp
  read_xdc C:/Users/vlad/Desktop/lab2/lab2.srcs/constrs_1/imports/new/top.xdc
  link_design -top Scheme -part xc7a200tfbg676-2
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force Scheme_opt.dcp
  create_report "impl_1_opt_report_drc_0" "report_drc -file Scheme_drc_opted.rpt -pb Scheme_drc_opted.pb -rpx Scheme_drc_opted.rpx"
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  if { [llength [get_debug_cores -quiet] ] > 0 }  { 
    implement_debug_core 
  } 
  place_design 
  write_checkpoint -force Scheme_placed.dcp
  create_report "impl_1_place_report_io_0" "report_io -file Scheme_io_placed.rpt"
  create_report "impl_1_place_report_utilization_0" "report_utilization -file Scheme_utilization_placed.rpt -pb Scheme_utilization_placed.pb"
  create_report "impl_1_place_report_control_sets_0" "report_control_sets -verbose -file Scheme_control_sets_placed.rpt"
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force Scheme_routed.dcp
  create_report "impl_1_route_report_drc_0" "report_drc -file Scheme_drc_routed.rpt -pb Scheme_drc_routed.pb -rpx Scheme_drc_routed.rpx"
  create_report "impl_1_route_report_methodology_0" "report_methodology -file Scheme_methodology_drc_routed.rpt -pb Scheme_methodology_drc_routed.pb -rpx Scheme_methodology_drc_routed.rpx"
  create_report "impl_1_route_report_power_0" "report_power -file Scheme_power_routed.rpt -pb Scheme_power_summary_routed.pb -rpx Scheme_power_routed.rpx"
  create_report "impl_1_route_report_route_status_0" "report_route_status -file Scheme_route_status.rpt -pb Scheme_route_status.pb"
  create_report "impl_1_route_report_timing_summary_0" "report_timing_summary -max_paths 10 -file Scheme_timing_summary_routed.rpt -pb Scheme_timing_summary_routed.pb -rpx Scheme_timing_summary_routed.rpx -warn_on_violation "
  create_report "impl_1_route_report_incremental_reuse_0" "report_incremental_reuse -file Scheme_incremental_reuse_routed.rpt"
  create_report "impl_1_route_report_clock_utilization_0" "report_clock_utilization -file Scheme_clock_utilization_routed.rpt"
  create_report "impl_1_route_report_bus_skew_0" "report_bus_skew -warn_on_violation -file Scheme_bus_skew_routed.rpt -pb Scheme_bus_skew_routed.pb -rpx Scheme_bus_skew_routed.rpx"
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force Scheme_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force Scheme.mmi }
  write_bitstream -force Scheme.bit 
  catch {write_debug_probes -quiet -force Scheme}
  catch {file copy -force Scheme.ltx debug_nets.ltx}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}


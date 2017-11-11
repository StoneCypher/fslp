
MachineConfigTransition
  = "transition" _WS? ":" _WS? "{" _WS? value:ConfigTransitionItems* _WS? "};" _WS? {
    return { term: "machine_config_transition", value, location: location() };
  }





MachineConfigStartState
  = "start_state" _WS? ":" _WS? "{" _WS? value:ConfigStateItems* _WS? "};" _WS? {
    return { term: "machine_config_start_state", value, location: location() };
  }

MachineConfigEndState
  = "end_state"   _WS? ":" _WS? "{" _WS? value:ConfigStateItems* _WS? "};" _WS? {
    return { term: "config", config_topic: "end_state", value, location: location() };
  }

MachineConfigState
  = "state"       _WS? ":" _WS? "{" _WS? value:ConfigStateItems* _WS? "};" _WS? {
    return { term: "config", config_topic: "state", value, location: location() };
  }





MachineConfig "machine config"
  = MachineConfigTransition
  / MachineConfigStartState
  / MachineConfigEndState
  / MachineConfigState


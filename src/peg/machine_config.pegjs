
MachineConfigTransition
  = "transition" _WS? ":" _WS? "{" _WS? value:ConfigTransitionItems* _WS? "};" _WS? {
    return { term: "config", config_topic: "transition", value, location: location() };
  }





MachineConfigStartState
  = "start_state" _WS? ":" _WS? "{" _WS? value:ConfigStateItems* _WS? "};" _WS? {
    return { term: "config", config_topic: "start_state", value, location: location() };
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


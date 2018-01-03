
MachineConfigTransition "machine config for transitions"
  = "transition" _WS? ":" _WS? "{" _WS? value:ConfigTransitionItems* _WS? "};" _WS? {
    return { term: "machine_config_transition", value, location: location() };
  }





MachineConfigStartState "machine config for start states"
  = term:"start_state" _WS? ":" _WS? "{" _WS? value:ConfigStateItems* _WS? "};" _WS? {
    return { term, value, location: location() };
  }

MachineConfigEndState "machine config for end states"
  = term:"end_state"   _WS? ":" _WS? "{" _WS? value:ConfigStateItems* _WS? "};" _WS? {
    return { term, value, location: location() };
  }

MachineConfigState "machine config for states"
  = term:"state"       _WS? ":" _WS? "{" _WS? value:ConfigStateItems* _WS? "};" _WS? {
    return { term, value, location: location() };
  }





MachineConfig "machine config"
  = MachineConfigTransition
  / MachineConfigStartState
  / MachineConfigEndState
  / MachineConfigState


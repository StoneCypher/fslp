
LabelOrListMachineAttributes
  = "machine_author"
  / "machine_contributor"
  / "machine_comment"
  / "machine_reference"

MachineAttribute_LabelOrList
  = term:LabelOrListMachineAttributes _WS? ":" _WS? value:_LabelOrLabelList _WS? ";" _WS? {
    return { term, value, location: location() };
  }





LabelMachineAttributes
  = "machine_name"
  / "machine_language"     // todo this is wrong, this should be 639-2 or whatever it is

MachineAttribute_Label
  = term:LabelMachineAttributes _WS? ":" _WS? value:_Label _WS? ";" _WS? {
    return { term, value, location: location() };
  }





SemverMachineAttributes
  = "machine_version"
  / "fsl_version"

MachineAttribute_Semver
  = term:SemverMachineAttributes _WS? ":" _WS? value:SemVer _WS? ";" _WS? {
    return { term, value, location: location() };
  }





MachineDefinition
  = "machine_definition" _WS? ":" _WS? definition:URL _WS? ";" _WS? {
    return { term: "machine_definition", value: definition, location: location() }; }


MachineLicense
  = "machine_license" _WS? ":" _WS? license:LicenseNotation _WS? ";" _WS? {
    return { term: "machine_license", value: license, location: location() }; }





MachineAttribute "machine attribute"
  = MachineDefinition
  / MachineLicense
  / MachineAttribute_LabelOrList
  / MachineAttribute_Label
  / MachineAttribute_Semver

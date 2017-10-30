
MachineAuthor
  = "machine_author" _WS? ":" _WS? author:_LabelOrLabelList _WS? ";" _WS? {
    return { term: "machine_author", value: author, location: location() }; }


MachineContributor
  = "machine_contributor" _WS? ":" _WS? contributor:_LabelOrLabelList _WS? ";" _WS? {
    return { term: "machine_contributor", value: contributor, location: location() }; }


MachineComment
  = "machine_comment" _WS? ":" _WS? comment:_LabelOrLabelList _WS? ";" _WS? {
    return { term: "machine_comment", value: comment, location: location() }; }


MachineDefinition
  = "machine_definition" _WS? ":" _WS? definition:URL _WS? ";" _WS? {
    return { term: "machine_definition", value: definition, location: location() }; }


MachineName
  = "machine_name" _WS? ":" _WS? name:_Label _WS? ";" _WS? {
    return { term: "machine_name", value: name, location: location() }; }


MachineReference
  = "machine_reference" _WS? ":" _WS? reference:_LabelOrLabelList _WS? ";" _WS? {
    return { term: "machine_reference", value: reference, location: location() }; }


MachineVersion
  = "machine_version" _WS? ":" _WS? version:SemVer _WS? ";" _WS? {
    return { term: "machine_version", value: version, location: location() }; }


MachineLicense
  = "machine_license" _WS? ":" _WS? license:LicenseNotation _WS? ";" _WS? {
    return { term: "machine_license", value: license, location: location() }; }


MachineLanguage
  = "machine_language" _WS? ":" _WS? language:_Label _WS? ";" _WS? {
    return { term: "machine_language", value: language, location: location() }; }


FslVersion
  = "fsl_version" _WS? ":" _WS? fsl_version:SemVer _WS? ";" _WS? {
    return { term: "fsl_version", value: fsl_version, location: location() }; }





MachineAttribute "machine attribute"
  = FslVersion
  / MachineName
  / MachineAuthor
  / MachineContributor
  / MachineComment
  / MachineDefinition
  / MachineVersion
  / MachineLicense
  / MachineLanguage

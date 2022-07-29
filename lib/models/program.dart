class Program {
  int? programId;
  String? programName;
  String? startDate;
  String? endDate;
  String? website;
  String? description;

  Program({
    this.programId,
    this.programName,
    this.startDate,
    this.endDate,
    this.website,
    this.description,
  });

  // Program findProgramByName(String name) {
  //   return programList.firstWhere((element) => element.programName == name);
  // }
}

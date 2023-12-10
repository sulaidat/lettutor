import 'package:lettutor/src/models/violation_report.dart';

class Bonker {
  List<ViolationReport>? violationReports;

  static Bonker? _instance;

  Bonker._();

  static Bonker get instance {
    _instance ??= Bonker._();
    return _instance!;
  }

  // Add a violation report
  void addReport(ViolationReport report) {
    violationReports ??= [];
    violationReports!.add(report);
  }
}
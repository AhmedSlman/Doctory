import 'package:equatable/equatable.dart';

class ReportProblemModel extends Equatable {
  final String problemText;
  final String? image;

  const ReportProblemModel({
    required this.problemText,
    this.image,
  });

  @override
  List<Object?> get props => [problemText, image];
}
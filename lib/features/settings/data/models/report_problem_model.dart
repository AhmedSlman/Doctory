import 'package:equatable/equatable.dart';

class ReportProblemModel extends Equatable {
  final String problemText;
  final String? imageUrl;

  const ReportProblemModel({
    required this.problemText,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [problemText, imageUrl];
}
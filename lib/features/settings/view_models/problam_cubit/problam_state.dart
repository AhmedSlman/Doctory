import 'package:doctory/features/settings/data/models/report_problem_model.dart';
import 'package:equatable/equatable.dart';

abstract class ReportProblemState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReportProblemInitial extends ReportProblemState {}

class ReportProblemLoading extends ReportProblemState {}

class ReportProblemSuccess extends ReportProblemState {
  final ProblemResponse problemResponse;

  ReportProblemSuccess(this.problemResponse);

  @override
  List<Object?> get props => [problemResponse];
}

class ReportProblemFailure extends ReportProblemState {
  final String error;

  ReportProblemFailure(this.error);

  @override
  List<Object?> get props => [error];
}


class ReportImagePickedSuccess extends ReportProblemState {
  final String imagePath;
  ReportImagePickedSuccess(this.imagePath);

  @override
  List<Object> get props => [imagePath];
}

class ReportImagePickError extends ReportProblemState {
  final String errorMsg;
  ReportImagePickError(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}

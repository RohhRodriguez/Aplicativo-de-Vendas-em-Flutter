part of 'comission_total_cubit.dart';

@immutable
abstract class TotalComissionState {}

class ComissionReportInitial extends TotalComissionState {}

class WaintingTotalComission extends TotalComissionState {}

class CalculatedTotalComission extends TotalComissionState {
  double totalComission;
  CalculatedTotalComission({
    required this.totalComission,
  });
}

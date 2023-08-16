// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'comission_report_detail_cubit.dart';

@immutable
abstract class ComissionReportDetailState {}

class ComissionReportDetailInitial extends ComissionReportDetailState {}

class LoadingDetailComissionReportData extends ComissionReportDetailState {}

class SuccessDetailComissionReportData extends ComissionReportDetailState {
  List<Pedido> listaPedidos;
  double totalComission;
  SuccessDetailComissionReportData({
    required this.listaPedidos,
    required this.totalComission,
  });
}

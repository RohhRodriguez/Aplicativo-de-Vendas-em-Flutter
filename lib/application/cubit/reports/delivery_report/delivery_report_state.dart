part of 'delivery_report_cubit.dart';

@immutable
abstract class DeliveryReportState {}

class DeliveryReportInitial extends DeliveryReportState {}

class WaintingTotalDelivery extends DeliveryReportState {}

class CalculatedTotalDelivery extends DeliveryReportState {
  final double totalDelivery;
  CalculatedTotalDelivery({
    required this.totalDelivery,
  });
}

class LoadingDeliveryReportData extends DeliveryReportState {}

class SuccessDeliveryReportData extends DeliveryReportState {
  final double totaldelivery;
  final List<Atendente> atendentList;
  final List<String> detaildeliveryList;
  final List<double> totalValueItem;
  SuccessDeliveryReportData({
    required this.totaldelivery,
    required this.atendentList,
    required this.detaildeliveryList,
    required this.totalValueItem,
  });
}

class ErrorDeliveryReportData extends DeliveryReportState {}

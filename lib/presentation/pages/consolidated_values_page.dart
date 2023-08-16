import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_desafio_flutter/presentation/pages/initial_page.dart';
import '../../application/cubit/cadastro_cubit/cadastro_teste/cadastro_cubit.dart';
import '../../application/cubit/reports/comission_report/totalization_report_cubit/comission_total_cubit.dart';
import '../../application/cubit/reports/delivery_report/delivery_report_cubit.dart';
import '../../application/cubit/reports/sales_report/sales_report_cubit.dart';
import '../../application/cubit/reports/stock_report/stock_report_cubit/stock_report_cubit.dart';
import '../../application/services/report_generic_service.dart';
import '../core/widgets/buttons/button.dart';

class SalesTotalResume extends StatelessWidget {
  const SalesTotalResume({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Faturamento',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            BlocBuilder<SalesReportCubit, SalesReportState>(builder: (context, state) {
              if (state is CalculatedTotalSales) {
                return Text(
                  'R\$ ${formatter.format(state.totalSales)}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                );
              }
              return const CircularProgressIndicator();
            })
          ],
        )),
        Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Icon(
              Icons.circle_outlined,
              size: 300,
              color: Colors.blue.shade200,
            ),
          ),
        )
      ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
class GenericInfoCompany extends StatelessWidget {
  const GenericInfoCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        fit: BoxFit.scaleDown,
        child: BlocBuilder<CadastroCubit, CadastroState>(builder: (context, state) {
          if (state is CompiledCompanyData) {
            return Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.centerLeft,
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Row(
                    children: [
                      const Icon(Icons.circle, size: 10, color: Colors.blue),
                      const SizedBox(width: 5),
                      Text(state.companyName, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 10),
                      const Icon(Icons.circle, size: 10, color: Colors.blue),
                      const SizedBox(width: 5),
                      Text('CNPJ: ${state.cnpj}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ]));
          }
          return const CircularProgressIndicator();
        }));
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
class BoxTotalReport extends StatelessWidget {
  const BoxTotalReport({super.key});

  String get titlePage => 'Relatórios';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 45,
      child: Column(
        children: [
          BlocBuilder<SalesReportCubit, SalesReportState>(
            builder: (context, state) {
              if (state is CalculatedTotalSales) {
                return ButtonReport(
                  reportGenerate: ReportGenerate.salesReport(),
                  total: state.totalSales,
                );
              }
              return ButtonReport(
                reportGenerate: ReportGenerate.salesReport(),
                total: null,
              );
            },
          ),
          const Spacer(flex: 1),
          BlocProvider<TotalComissionCubit>(
            create: (BuildContext context) => TotalComissionCubit(),
            child: BlocBuilder<TotalComissionCubit, TotalComissionState>(builder: (context, state) {
              if (state is CalculatedTotalComission) {
                return ButtonReport(
                  reportGenerate: ReportGenerate.commissionReport(),
                  total: state.totalComission,
                );
              }
              return ButtonReport(
                reportGenerate: ReportGenerate.commissionReport(),
                total: null,
              );
            }),
          ),
          const Spacer(flex: 1),
          BlocProvider<StockReportCubit>(
              create: (BuildContext context) => StockReportCubit(),
              child: BlocBuilder<StockReportCubit, StockReportState>(builder: (context, state) {
                if (state is CalculatedTotalStock) {
                  return ButtonReport(
                    reportGenerate: ReportGenerate.stockReport(),
                    total: state.totalStock,
                  );
                }
                return ButtonReport(
                  reportGenerate: ReportGenerate.stockReport(),
                  total: null,
                );
              })),
          const Spacer(flex: 1),
          BlocBuilder<DeliveryReportCubit, DeliveryReportState>(builder: (context, state) {
            if (state is CalculatedTotalDelivery) {
              return ButtonReport(
                reportGenerate: ReportGenerate.deliveryReport(),
                total: state.totalDelivery,
              );
            }
            return ButtonReport(
              reportGenerate: ReportGenerate.deliveryReport(),
              total: null,
            );
          }),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}

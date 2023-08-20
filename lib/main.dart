import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_desafio_flutter/domain/provider/clientes.dart';
import 'package:projeto_desafio_flutter/domain/provider/produtos.dart';
import 'package:projeto_desafio_flutter/presentation/pages/teste/adicionar_atendente.dart';
import 'package:provider/provider.dart';
import 'application/cubit/cadastro_cubit/cadastro_teste/cadastro_cubit.dart';
import 'application/cubit/reports/delivery_report/delivery_report_cubit.dart';
import 'application/cubit/reports/sales_report/sales_report_cubit.dart';
import 'domain/models/repository/atendentes_repository.dart';
import 'domain/provider/pedidos.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => AtendenteRepository());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Produtos(),
        ),
        ChangeNotifierProvider(
          create: (context) => Clientes(),
        ),
        ChangeNotifierProvider(
          create: (context) => Pedidos(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Projeto App de Vendas em Flutter',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MultiBlocProvider(
            providers: [
              BlocProvider<CadastroCubit>(
                create: (BuildContext context) => CadastroCubit(),
              ),
              BlocProvider<SalesReportCubit>(
                create: (BuildContext context) => SalesReportCubit(),
              ),
              BlocProvider<DeliveryReportCubit>(
                create: (BuildContext context) => DeliveryReportCubit(),
              ),
            ],
            // child: const ConsolidatedValuesPage(),
            child: AdicionarAtendente(),
            // child: const AdicionarProduto(),
            // child: const AdicionarCliente(),
            // child: const AdicionarPedido(),
          )),
    );
  }
}

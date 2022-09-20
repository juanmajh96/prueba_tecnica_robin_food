import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/catalog/animations/animations.dart';
import 'package:prueba_tecnica/catalog/cards/cards.dart';
import 'package:prueba_tecnica/catalog/errors/errors.dart';
import 'package:prueba_tecnica/catalog/image/image.dart';
import 'package:prueba_tecnica/catalog/notifiers/notifiers.dart';
import 'package:prueba_tecnica/catalog/progress/progress.dart';
import 'package:prueba_tecnica/catalog/typography/typography.dart';
import 'package:prueba_tecnica/data/datasource/result/result.dart';
import 'package:prueba_tecnica/data/repository/result/result.dart';
import 'package:prueba_tecnica/domain/entities/result/result.dart';
import 'package:prueba_tecnica/domain/repositories/result/result.dart';
import 'package:prueba_tecnica/domain/usecases/result/result.dart';
import 'package:prueba_tecnica/external/result/result.dart';
import 'package:prueba_tecnica/lang/lang.dart';
import 'package:prueba_tecnica/screens/result/model/model.dart';
import 'package:prueba_tecnica/screens/result/view_model/view_model.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.queryParam});

  final String queryParam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MultiProvider(
        providers: [
          Provider<ResultDatasource>(
            create: (BuildContext context) => GetDataApiImpl(
              client: http.Client(),
            ),
          ),
          Provider<ResultRepositories>(
            create: (BuildContext context) => ResultRepository(
              context.read<ResultDatasource>(),
            ),
          ),
          Provider<GetData>(
            create: (BuildContext context) => GetDataImpl(
              context.read<ResultRepositories>(),
            ),
          ),
          Provider<ResultViewModel>(
            create: (BuildContext context) => ResultViewModel(
              getData: context.read<GetData>(),
              model: ResultModel(),
              queryParam: queryParam,
            )..getData(),
          ),
        ],
        child: Builder(
          builder: (context) {
            final _viewModel = context.read<ResultViewModel>();
            return MultipleValueListenableBuilder(
              first: _viewModel.model.listDataEntity,
              second: _viewModel.model.isLoading,
              third: _viewModel.model.isError,
              builder:
                  (buildContext, listDataEntity, isLoading, isError, child) {
                if (isLoading) {
                  return const LoadingIndicator();
                }
                if (isError) {
                  return const IsErrorWidget();
                }
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: listDataEntity.length,
                  itemBuilder: (context, index) => FadeRigthAnimation(
                    durationTransform: const Duration(milliseconds: 800),
                    durationOpacity: const Duration(milliseconds: 800),
                    childWidget: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute<DetaislResultView>(
                          builder: (context) => DetaislResultView(
                            dataEntity: listDataEntity[index],
                          ),
                        ),
                      ),
                      child: CardWidget(
                        dataEntity: listDataEntity[index],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class DetaislResultView extends StatelessWidget {
  const DetaislResultView({super.key, required this.dataEntity});

  final DataEntity dataEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              dataEntity.title?.let(
                    (value) => TitleText(text: value),
                  ) ??
                  const SizedBox(),
              const SizedBox(
                height: 30,
              ),
              ImageNetworkWidget(
                keyId: dataEntity.key,
                coverId: dataEntity.coverId,
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: dataEntity.subject?.let(
                      (value) => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: value.length,
                        itemBuilder: (context, index) => SubCapitalText(
                          color: Colors.white60,
                          text: value[index],
                        ),
                      ),
                    ) ??
                    const SubCapitalText(
                      color: Colors.white60,
                      text: 'Not Available',
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

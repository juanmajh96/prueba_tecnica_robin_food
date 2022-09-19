import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/catalog/catalog.dart';
import 'package:prueba_tecnica/screens/search/model/model.dart';
import 'package:prueba_tecnica/screens/search/view_model/view_model.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Provider<SearchViewModel>(
          create: (context) => SearchViewModel(model: SearchModel()),
          dispose: (context, value) => value.dispose(),
          child: Builder(
            builder: (context) {
              final _viewModel = context.read<SearchViewModel>();
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: FadeDownAnimation(
                        childWidget: CapitalText(
                          text: _viewModel.model.title,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SearchButtonAnimation(
                            onSearch: (String text) {
                              ///aca
                            },
                          ),
                          const SplashAnimation(),
                        ],
                      ),
                    ),
                    Flexible(
                      child: FadeDownAnimation(
                        durationTransform: const Duration(seconds: 2),
                        durationOpacity: const Duration(seconds: 3),
                        childWidget: SubCapitalText(
                          text: _viewModel.model.description,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

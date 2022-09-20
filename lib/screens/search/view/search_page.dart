import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/catalog/catalog.dart';
import 'package:prueba_tecnica/screens/result/result.dart';
import 'package:prueba_tecnica/screens/search/model/model.dart';
import 'package:prueba_tecnica/screens/search/view_model/view_model.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<SearchViewModel>(
        create: (context) => SearchViewModel(model: SearchModel()),
        dispose: (context, value) => value.dispose(),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CapitalTitleSearchView(),
                SearchButtonSearchView(),
                SubBodySearchView(),
              ],
            ),
            const SplashAnimation(),
          ],
        ),
      ),
    );
  }
}

class CapitalTitleSearchView extends StatelessWidget {
  const CapitalTitleSearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _viewModel = context.read<SearchViewModel>();
    return Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: FadeDownAnimation(
          childWidget: CapitalText(
            text: _viewModel.model.title,
          ),
        ),
      ),
    );
  }
}

class SearchButtonSearchView extends StatelessWidget {
  const SearchButtonSearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: SearchButtonAnimation(
          onSearch: (String text) {
            Navigator.push(
              context,
              BouncyPageAnimation(
                widget: ResultView(queryParam: text),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SubBodySearchView extends StatelessWidget {
  const SubBodySearchView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final _viewModel = context.read<SearchViewModel>();
    return Expanded(
      flex: 2,
      child: FadeDownAnimation(
        durationTransform: const Duration(seconds: 2),
        durationOpacity: const Duration(seconds: 3),
        childWidget: SubCapitalText(
          text: _viewModel.model.description,
        ),
      ),
    );
  }
}

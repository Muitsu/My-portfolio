import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'providers.dart';

class AppProviders {
  static List<SingleChildWidget> get providers => _providers;
  //Register provider here
  static final List<SingleChildWidget> _providers = [
    ChangeNotifierProvider<PortfolioProvider>(
      create: (context) => PortfolioProvider(),
    ),
  ];
}

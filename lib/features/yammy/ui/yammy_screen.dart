import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class YammyScreen extends StatelessWidget {
  const YammyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Вкусняшки');
  }
}

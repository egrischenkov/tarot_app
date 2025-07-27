import 'package:auto_route/annotations.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class FunnyScreen extends StatelessWidget {
  const FunnyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Приколики');
  }
}

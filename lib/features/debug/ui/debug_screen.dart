import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/features/debug/ui/widgets/debug_card_widget.dart';
import 'package:taro/features/debug/ui/widgets/debug_option_button.dart';
import 'package:taro/features/debug/ui/widgets/debug_value_widget.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

@RoutePage()
class DebugScreen extends StatefulWidget {
  const DebugScreen({super.key});

  @override
  State<DebugScreen> createState() => _DebugScreenState();
}

class _DebugScreenState extends State<DebugScreen> {
  bool _isClearing = false;

  @override
  Widget build(BuildContext context) {
    final packageInfo = context.appDependenciesContainer.packageInfoService;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: UiKitSpacing.x4),
        child: Column(
          children: intersperse(
            UiKitSpacing.x4.h,
            [
              DebugOptionButton(
                title: 'Открыть http инспектор',
                onTap: context.appDependenciesContainer.httpInspectorService.showInspector,
              ),
              DebugCardWidget(
                title: 'Tarot App',
                children: [
                  DebugValueWidget(
                    title: 'Bundle ID',
                    value: packageInfo.packageName,
                  ),
                  DebugValueWidget(
                    title: 'App Name',
                    value: packageInfo.appName,
                  ),
                  DebugValueWidget(
                    title: 'App Version',
                    value: packageInfo.appVersion,
                  ),
                  DebugValueWidget(
                    title: 'Installer Store',
                    value: packageInfo.installerStore ?? '-',
                  ),
                ],
              ),
              DebugCardWidget(
                title: 'Конфигурация среды',
                children: [
                  DebugValueWidget(
                    title: 'Environment',
                    value: context.appDependenciesContainer.flavor.name,
                  ),
                ],
              ),
              DebugOptionButton(
                title: 'Очистить локальное хранилище',
                onTap: _clearStorage,
                isLoading: _isClearing,
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }

  Future<void> _clearStorage() async {
    setState(() {
      _isClearing = true;
    });

    await context.appDependenciesContainer.appConfigurationsStorage.clear();

    setState(() {
      _isClearing = false;
    });

    if (context.mounted) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Локальное хранилище очищено')),
      );
    }
  }
}

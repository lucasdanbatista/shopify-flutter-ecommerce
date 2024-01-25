import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'observed_data.dart';

typedef ObservableWidgetBuilder<T> = Widget Function(
  BuildContext context,
  ObservedData<T> data,
);

class ObservableWidget<T> extends StatelessWidget {
  final ValueListenable<ObservedData<T>> observable;
  final ObservableWidgetBuilder<T> builder;

  const ObservableWidget({
    super.key,
    required this.observable,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ObservedData<T>>(
      valueListenable: observable,
      builder: (context, data, child) => builder(context, data),
    );
  }
}

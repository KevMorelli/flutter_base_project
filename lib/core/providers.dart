import 'package:flutter_base_project/core/error_handler.dart';
import 'package:flutter_base_project/core/viewmodels/counter_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:version_tracker/version_tracker.dart';

class Providers {
  static final errorHandlerProvider = Provider<ErrorHandler>((_) => ErrorHandler());
  static final versionTrackerProvider = Provider<VersionTracker>((_) => VersionTracker());

  static final counterViewModel = ChangeNotifierProvider.autoDispose((ref) {
    return CounterViewModel();
  });
}

import 'package:flutter_base_project/core/services/error_handler_service.dart';
import 'package:flutter_base_project/core/viewmodels/counter_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:version_tracker/version_tracker.dart';

class Providers {
  // Services
  static final versionTrackerService = Provider<VersionTracker>((_) => VersionTracker());
  static final errorHandlerService = Provider<ErrorHandlerService>((_) => ErrorHandlerService());

  // ViewModels
  static final counterViewModel = ChangeNotifierProvider.autoDispose((ref) {
    return CounterViewModel();
  });
}

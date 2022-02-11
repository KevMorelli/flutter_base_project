import 'package:flutter_base_project/core/services/error_handler_service.dart';
import 'package:flutter_base_project/core/viewmodels/counter_viewmodel.dart';
import 'package:flutter_base_project/core/viewmodels/login_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:version_tracker/version_tracker.dart';

class Providers {
  // Services
  static final versionTrackerService = Provider((_) => VersionTracker());
  static final errorHandlerService = Provider((_) => ErrorHandlerService());

  // ViewModels
  static final loginViewModel = ChangeNotifierProvider.autoDispose((_) => LoginViewModel());
  static final homeViewModel = ChangeNotifierProvider.autoDispose((_) => HomeViewModel());
}

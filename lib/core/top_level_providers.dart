import 'package:flutter_base_project/core/error_handler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:version_tracker/version_tracker.dart';

final errorHandlerProvider = Provider<ErrorHandler>((_) => ErrorHandler());
final versionTrackerProvider = Provider<VersionTracker>((_) => VersionTracker());

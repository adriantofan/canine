import 'package:go_router/go_router.dart';

abstract class RouterPath {
  String get pattern;
}

class RootPath implements RouterPath {
  final String path;
  const RootPath({
    required this.path,
  });
  @override
  // TODO: implement pattern
  String get pattern => path;
}

class WorkspacePath implements RouterPath {
  static const String pathKey = 'workspaceId';
  @override
  final String pattern;
  final String subPath;
  const WorkspacePath({required this.subPath})
      : pattern = '/workspace/:$pathKey$subPath';

  String path(dynamic workspaceId) {
    return '/workspace/$workspaceId$subPath';
  }

  bool isOnSubpath(Uri path) {
    if (path.pathSegments.length < 3) {
      return false;
    }
    if (int.tryParse(path.pathSegments[1]) == null) {
      return false;
    }

    final rest = path.pathSegments.sublist(2).join('/');
    return '/$rest'.startsWith(subPath);
  }

  static int? parseWorkspaceId(Uri path) {
    final segments = path.pathSegments;
    return segments.isNotEmpty ? int.tryParse(path.pathSegments[1]) : null;
  }

  int? workspaceId(Uri path) {
    return WorkspacePath.parseWorkspaceId(path);
  }

  static int? workspaceIdFromState(GoRouterState state) {
    final id = state.pathParameters[pathKey];
    return id == null ? null : int.tryParse(id);
  }
}

class ConversationPath implements RouterPath {
  static const String conversationIdPathKey = 'conversationId';
  @override
  final String pattern;
  final WorkspacePath _homePath;
  ConversationPath(this._homePath)
      : pattern = '${_homePath.pattern}/:$conversationIdPathKey' {
    assert(_homePath.pattern.split('/').length == 4);
  }

  String path(int workspaceId, int conversationId) {
    return '${_homePath.path(workspaceId)}/$conversationId';
  }

  isOn(Uri path) {
    if (!_homePath.isOnSubpath(path)) {
      return false;
    }
    if (path.pathSegments.length == 3) {
      return true;
    }

    if (path.pathSegments.length == 4) {
      return true;
    }
    return false;
  }

  int? workspaceId(Uri path) {
    return _homePath.workspaceId(path);
  }

  int? conversationId(Uri path) {
    if (path.pathSegments.length != 4) {
      return null;
    }
    return int.tryParse(path.pathSegments[3]);
  }

  static int? getConversationId(GoRouterState state) {
    final id = state.pathParameters[conversationIdPathKey];
    return id == null ? null : int.tryParse(id);
  }
}

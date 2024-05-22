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
  const WorkspacePath({required this.subPath}) : pattern = '/:$pathKey$subPath';

  String path(dynamic workspaceId) {
    return '/$workspaceId$subPath';
  }

  bool isOnSubpath(Uri path) {
    if (path.pathSegments.length < 2) {
      return false;
    }
    if (int.tryParse(path.pathSegments[0]) == null) {
      return false;
    }

    final rest = path.pathSegments.sublist(1).join('/');
    return '/$rest'.startsWith(subPath);
  }

  static int? parseWorkspaceId(Uri path) {
    final segments = path.pathSegments;
    return segments.isNotEmpty ? int.tryParse(path.pathSegments[0]) : null;
  }

  int? workspaceId(Uri path) {
    return WorkspacePath.parseWorkspaceId(path);
  }
}

class ConversationPath implements RouterPath {
  @override
  final String pattern;
  final WorkspacePath _homePath;
  ConversationPath(this._homePath)
      : pattern = '${_homePath.pattern}/:conversationId' {
    assert(_homePath.pattern.split('/').length == 3);
  }

  String path(int workspaceId, int conversationId) {
    return '${_homePath.path(workspaceId)}/$conversationId';
  }

  isOn(Uri path) {
    if (!_homePath.isOnSubpath(path)) {
      return false;
    }
    if (path.pathSegments.length == 2) {
      return true;
    }

    if (path.pathSegments.length == 3) {
      return true;
    }
    return false;
  }

  int? workspaceId(Uri path) {
    return _homePath.workspaceId(path);
  }

  int? conversationId(Uri path) {
    if (path.pathSegments.length != 3) {
      return null;
    }
    return int.tryParse(path.pathSegments[2]);
  }
}

abstract interface class Environment {
  Uri get apiBaseUrl;
}

class DebugEnvironment implements Environment {
  @override
  Uri get apiBaseUrl => Uri.parse(
        const String.fromEnvironment('DEBUG_API_BASE_URL'),
      );
}

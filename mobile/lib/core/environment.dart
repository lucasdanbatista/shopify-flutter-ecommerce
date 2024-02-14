abstract interface class Environment {
  Uri get apiBaseUrl;
}

class DebugEnvironment implements Environment {
  @override
  Uri get apiBaseUrl {
    const key = 'DEBUG_API_BASE_URL';
    return const bool.hasEnvironment(key)
        ? Uri.parse(const String.fromEnvironment(key))
        : Uri.parse(
            'http://staging.eba-vxcut3b6.sa-east-1.elasticbeanstalk.com',
          );
  }
}

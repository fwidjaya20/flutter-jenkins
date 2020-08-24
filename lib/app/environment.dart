import 'package:meta/meta.dart';

class Environment {
  final String baseUrl;

  const Environment({
    @required this.baseUrl
  });

  factory Environment.staging() {
    return Environment(
      baseUrl: r"https://api.opendota.com/api"
    );
  }
}
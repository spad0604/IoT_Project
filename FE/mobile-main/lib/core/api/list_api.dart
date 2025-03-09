class ListAPI {
  ListAPI._(); // coverage:ignore-line

  /// Auth
  static const String user = "/v1/api/user";
  static const String login = "/auth/login";
  static const String logout = "/auth/logout";

  /// User
  static const String users = "/v1/api/user/all";

  static const String device = "/led";
}

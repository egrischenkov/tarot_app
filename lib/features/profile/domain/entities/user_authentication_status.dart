enum UserAuthenticationStatus {
  authenticated,
  unauthenticated,
}

extension UserAuthenticationStatusX on UserAuthenticationStatus {
  bool get isAuthenticated => this == UserAuthenticationStatus.authenticated;
}

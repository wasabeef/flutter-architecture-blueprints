abstract class UserAnalyticsDataSource {
  bool isFirstLaunch();

  Future<void> saveFirstLaunch(bool value);
}

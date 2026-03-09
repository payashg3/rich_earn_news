import 'package:shared_preferences/shared_preferences.dart';
import 'coin_manager.dart';

class StreakManager {
  static Future<int> checkDailyLogin() async {
    final prefs = await SharedPreferences.getInstance();

    final lastLogin = prefs.getString("lastLoginDate");
    int streak = prefs.getInt("streak") ?? 0;

    final today = DateTime.now();
    final todayStr = "${today.year}-${today.month}-${today.day}";

    if (lastLogin == null) {
      streak = 1;

      prefs.setString("lastLoginDate", todayStr);
      prefs.setInt("streak", streak);

      await CoinManager.addCoins(10);

      return streak;
    }

    DateTime lastDate = DateTime.parse(lastLogin);
    final difference = today.difference(lastDate).inDays;

    if (difference == 1) {
      streak += 1;

      prefs.setInt("streak", streak);
      prefs.setString("lastLoginDate", todayStr);

      int reward = streak * 10;
      await CoinManager.addCoins(reward);

      return streak;
    }

    if (difference > 1) {
      streak = 1;

      prefs.setInt("streak", streak);
      prefs.setString("lastLoginDate", todayStr);

      await CoinManager.addCoins(10);

      return streak;
    }

    return streak;
  }
}

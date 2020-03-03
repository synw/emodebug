/// The debug printer
class EmoDebug {
  /// Default constructor
  const EmoDebug(
      {this.level, this.deactivate = false, this.deactivateEmojis = false});

  /// Deactivate the debug session
  ///
  /// This will not print anything anymore
  final bool deactivate;

  /// The debug level
  ///
  /// An optional indication about a local debug area. It
  /// will prefix the messages
  final String level;

  /// Deactivate the emojis
  ///
  /// This will not print the emojis in the log messages
  final bool deactivateEmojis;

  /// A debug message for a state operation
  ///
  /// emoji: 📢
  String state([dynamic obj, String domain]) => emo("📢", obj, domain);

  /// A debug message for a save operation
  ///
  /// emoji: 💾
  String save([dynamic obj, String domain]) => emo("💾", obj, domain);

  /// A debug message for a delete operation
  ///
  /// emoji: ❌
  String delete([dynamic obj, String domain]) => emo("❌", obj, domain);

  /// A debug message for a database query
  ///
  /// emoji: ❓
  String query([dynamic obj, String domain]) => emo("❓", obj, domain);

  /// A debug message for a dataset
  ///
  /// emoji: 💼
  String data([dynamic obj, String domain]) => emo("💼", obj, domain);

  /// A debug message representing a line
  ///
  /// emoji: ➖
  String line([dynamic obj, String domain]) => emo("➖", obj, domain);

  /// A debug message for an initialization
  ///
  /// emoji: 🎬
  String init([dynamic obj, String domain]) => emo("🎬", obj, domain);

  /// A debug message for an update
  ///
  /// emoji: 🆙
  String update([dynamic obj, String domain]) => emo("🆙", obj, domain);

  /// A debug message for an ok state
  ///
  /// emoji: 🆗
  String ok([dynamic obj, String domain]) => emo("🆗", obj, domain);

  /// A debug message for an build
  ///
  /// emoji: 🔧
  String build([dynamic obj, String domain]) => emo("🔧", obj, domain);

  /// A debug message for parameters
  ///
  /// emoji: 📥
  String param([dynamic obj, String domain]) => emo("📥", obj, domain);

  /// A debug message for a class constructor
  ///
  /// emoji: 🛠️
  String constructor([dynamic obj, String domain]) => emo("🛠️", obj, domain);

  /// A debug message for a time related operation
  ///
  /// emoji: ⏱️
  String time([dynamic obj, String domain]) => emo("⏱️", obj, domain);

  /// A debug message for a not found status
  ///
  /// emoji: 🚫
  String notFound([dynamic obj, String domain]) => emo("🚫", obj, domain);

  /// A debug message for a found status
  ///
  /// emoji: 👁️‍🗨️
  String found([dynamic obj, String domain]) => emo("👁️‍🗨️", obj, domain);

  /// A debug message for a result
  ///
  /// emoji: 📌
  String result([dynamic obj, String domain]) => emo("📌", obj, domain);

  /// A debug message for information an input operation
  ///
  /// emoji: 📥
  String input([dynamic obj, String domain]) => emo("📥", obj, domain);

  /// A debug message for information an output operation
  ///
  /// emoji: 📤
  String output([dynamic obj, String domain]) => emo("📤", obj, domain);

  /// A debug message for a function
  ///
  /// emoji: 💊
  String function([dynamic obj, String domain]) => emo("💊", obj, domain);

  /// A debug message for a key
  ///
  /// emoji: 🔑
  String key([dynamic obj, String domain]) => emo("🔑", obj, domain);

  /// A debug message for an encryption operation
  ///
  /// emoji: 🎼
  String encrypt([dynamic obj, String domain]) => emo("🎼", obj, domain);

  /// A debug message for an decryption operation
  ///
  /// emoji: 🗝️
  String decrypt([dynamic obj, String domain]) => emo("🗝️", obj, domain);

  /// A debug message for an transmission operation
  ///
  /// emoji: 📡
  String transmit([dynamic obj, String domain]) => emo("📡", obj, domain);

  /// Print a debug message from an emoji
  String emo(String emoji, [dynamic obj, String domain]) {
    final msg = _getEmoString(emoji, obj, domain);
    if (!deactivate) {
      print(msg);
    }
    return msg;
  }

  /// A separator line
  String sep() {
    const msg = "➖➖➖➖➖➖➖➖➖➖➖";
    if (!deactivate) {
      print(msg);
    }
    return msg;
  }

  /// A section start
  String section(String name) {
    final msg = "➖➖➖➖➖ $name ➖➖➖➖➖";
    if (!deactivate) {
      print(msg);
    }
    return msg;
  }

  /// A section end
  String sectionEnd() => sep();

  String _getEmoString(String emoji, dynamic obj, String domain) {
    var str = "";
    if (!deactivateEmojis) {
      str = "$emoji";
    }
    if (level != null) {
      str += " [$level]";
    }
    var dm = "";
    if (domain != null) {
      dm += ' ${domain[0].toUpperCase()}${domain.substring(1)}: ';
    }
    var res = "$str$dm";
    if (obj != null) {
      res += " $obj";
    }
    return res;
  }
}

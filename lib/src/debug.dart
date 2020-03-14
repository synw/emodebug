import 'types.dart';

/// The debug printer
class EmoDebug {
  /// Default constructor
  const EmoDebug(
      {this.level,
      this.hook,
      this.deactivatePrint = false,
      this.deactivateEmojis = false});

  /// Deactivate the debug session
  ///
  /// This will not print anything anymore
  final bool deactivatePrint;

  /// The debug level
  ///
  /// An optional indication about a local debug area. It
  /// will prefix the messages
  final String level;

  /// A hook to execute after each function call
  ///
  /// Can be used to pipe the emodebug messages to logging
  final EmoDebugHook hook;

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

  /// A debug message for a transmission operation
  ///
  /// emoji: 📡
  String transmit([dynamic obj, String domain]) => emo("📡", obj, domain);

  /// A debug message for a start operation
  ///
  /// emoji: 🏁
  String start([dynamic obj, String domain]) => emo("🏁", obj, domain);

  /// A debug message for a stop operation
  ///
  /// emoji: 🛑
  String stop([dynamic obj, String domain]) => emo("🛑", obj, domain);

  /// A debug message for an info
  ///
  /// emoji: ℹ️
  String info([dynamic obj, String domain]) => emo("ℹ️", obj, domain);

  /// A debug message for a warning
  ///
  /// emoji: 🔔
  String warning([dynamic obj, String domain]) => emo("🔔", obj, domain);

  /// A debug message for a warning
  ///
  /// emoji: 💢
  String error([dynamic obj, String domain]) => emo("💢", obj, domain);

  /// A debug message with an arrow
  ///
  /// emoji: =>
  String arrowIn([dynamic obj, String domain]) => emo("=>", obj, domain);

  /// A debug message with an arrow
  ///
  /// emoji: <=
  String arrowOut([dynamic obj, String domain]) => emo("<=", obj, domain);

  /// A debug message with an arrow
  ///
  /// emoji: ->
  String smallArrowIn([dynamic obj, String domain]) => emo("->", obj, domain);

  /// A debug message with an arrow
  ///
  /// emoji: <-
  String smallArrowOut([dynamic obj, String domain]) => emo("<-", obj, domain);

  /// A debug message for a ready state
  ///
  /// emoji: ⏲️
  String ready([dynamic obj, String domain]) {
    obj ??= "ready";
    return emo("⏲️", obj, domain);
  }

  /// A simple message with no emoji
  String msg([dynamic obj, String domain]) => emo(null, obj, domain);

  /// Print a debug message from an emoji
  String emo(String emoji, [dynamic obj, String domain]) {
    final msg = _getEmoString(emoji, obj, domain);
    if (!deactivatePrint) {
      print(msg);
    }
    if (hook != null) {
      hook(msg);
    }
    return msg;
  }

  /// A separator line
  String sep() {
    const msg = "➖➖➖➖➖➖➖➖➖➖➖";
    if (!deactivatePrint) {
      print(msg);
    }
    return msg;
  }

  /// A section start
  String section(String name) {
    final msg = "➖➖➖➖➖ $name ➖➖➖➖➖";
    if (!deactivatePrint) {
      print(msg);
    }
    return msg;
  }

  /// A section end
  String sectionEnd() => sep();

  String _getEmoString(String emoji, dynamic obj, String domain) {
    final l = <String>[];
    if (!deactivateEmojis && emoji != null) {
      l.add("$emoji");
    }
    if (level != null) {
      l.add("[$level]");
    }
    if (domain != null) {
      final dm = '${domain[0].toUpperCase()}${domain.substring(1)}:';
      l.add(dm);
    }
    if (obj != null) {
      l.add("$obj");
    }
    //print("$obj ======= $emoji");
    //print(l);
    return l.join(" ");
  }
}

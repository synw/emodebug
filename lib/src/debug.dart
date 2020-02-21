/// The debug printer
class EmoDebug {
  /// Default constructor
  const EmoDebug({this.deactivate = false});

  /// Deactivate the debug session
  ///
  /// This will not print anything anymore
  final bool deactivate;

  /// A debug message for a state operation
  ///
  /// emoji: 📢
  void state(dynamic obj, [String domain]) => emo("📢", obj, domain);

  /// A debug message for a save operation
  ///
  /// emoji: 💾
  void save(dynamic obj, [String domain]) => emo("💾", obj, domain);

  /// A debug message for a delete operation
  ///
  /// emoji: ❌
  void delete(dynamic obj, [String domain]) => emo("❌", obj, domain);

  /// A debug message for a database query
  ///
  /// emoji: ❓
  void query(dynamic obj, [String domain]) => emo("❓", obj, domain);

  /// A debug message for a dataset
  ///
  /// emoji: 💼
  void data(dynamic obj, [String domain]) => emo("💼", obj, domain);

  /// A debug message representing a line
  ///
  /// emoji: ➖
  void line(dynamic obj, [String domain]) => emo("➖", obj, domain);

  /// A debug message for an initialization
  ///
  /// emoji: 🎬
  void init(dynamic obj, [String domain]) => emo("🎬", obj, domain);

  /// A debug message for an update
  ///
  /// emoji: 🆙
  void update(dynamic obj, [String domain]) => emo("🆙", obj, domain);

  /// A debug message for an ok state
  ///
  /// emoji: 🆗
  void ok(dynamic obj, [String domain]) => emo("🆗", obj, domain);

  /// A debug message for an build
  ///
  /// emoji: 🔧
  void build(dynamic obj, [String domain]) => emo("🔧", obj, domain);

  /// A debug message for parameters
  ///
  /// emoji: 📥
  void param(dynamic obj, [String domain]) => emo("📥", obj, domain);

  /// A debug message for a class constructor
  ///
  /// emoji: 🛠️
  void constructor(dynamic obj, [String domain]) => emo("🛠️", obj, domain);

  /// A debug message for a time related operation
  ///
  /// emoji: ⏱️
  void time(dynamic obj, [String domain]) => emo("⏱️", obj, domain);

  /// A debug message for a not found status
  ///
  /// emoji: 🚫
  void notFound(dynamic obj, [String domain]) => emo("🚫", obj, domain);

  /// A debug message for a found status
  ///
  /// emoji: 👁️‍🗨️
  void found(dynamic obj, [String domain]) => emo("👁️‍🗨️", obj, domain);

  /// A debug message for a result
  ///
  /// emoji: 📌
  void result(dynamic obj, [String domain]) => emo("📌", obj, domain);

  /// A debug message for a function
  ///
  /// emoji: 💊
  void function(dynamic obj, [String domain]) => emo("", obj, domain);

  /// Print a debug message from an emoji
  void emo(String emoji, dynamic obj, [String domain]) {
    if (deactivate) {
      return;
    }
    print(_getEmoString(emoji, obj, domain));
  }

  /// A separator line
  void sep() {
    if (deactivate) {
      return;
    }
    print("➖➖➖➖➖➖➖➖➖➖➖");
  }

  /// A section start
  void section(String name) {
    if (deactivate) {
      return;
    }
    print("➖➖➖➖➖ $name ➖➖➖➖➖");
  }

  /// A section end
  void sectionEnd() => sep();

  String _getEmoString(String emoji, dynamic obj, [String domain]) {
    var dm = "";
    if (domain != null) {
      dm += '${domain[0].toUpperCase()}${domain.substring(1)}: ';
    }
    return "$emoji $dm$obj";
  }
}

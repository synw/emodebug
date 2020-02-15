/// The debug printer
class EmoDebug {
  /// Default constructor
  const EmoDebug();

  /// A debug message for a state operation
  void state(dynamic obj, [String domain]) => emo("📢", obj, domain);

  /// A debug message for a save operation
  void save(dynamic obj, [String domain]) => emo("💾", obj, domain);

  /// A debug message for a delete operation
  void delete(dynamic obj, [String domain]) => emo("❌", obj, domain);

  /// A debug message for a database query
  void query(dynamic obj, [String domain]) => emo("❓", obj, domain);

  /// A debug message for a dataset
  void data(dynamic obj, [String domain]) => emo("💼", obj, domain);

  /// A debug message representing a line
  void line(dynamic obj, [String domain]) => emo("➖", obj, domain);

  /// A debug message for an initialization
  void init(dynamic obj, [String domain]) => emo("🎬", obj, domain);

  /// A debug message for an update
  void update(dynamic obj, [String domain]) => emo("🆙", obj, domain);

  /// A debug message for an ok state
  void ok(dynamic obj, [String domain]) => emo("🆗", obj, domain);

  /// A debug message for an build
  void build(dynamic obj, [String domain]) => emo("🔧", obj, domain);

  /// A debug message for parameters
  void param(dynamic obj, [String domain]) => emo("📥", obj, domain);

  /// A debug message for a class constructor
  void constructor(dynamic obj, [String domain]) => emo("🛠️", obj, domain);

  /// A debug message for a time related operation
  void time(dynamic obj, [String domain]) => emo("⏱️", obj, domain);

  /// Print a debug message from an emoji
  void emo(String emoji, dynamic obj, [String domain]) {
    var dm = "";
    if (domain != null) {
      dm += '${domain[0].toUpperCase()}${domain.substring(1)}: ';
    }
    print("$emoji $dm$obj");
  }
}

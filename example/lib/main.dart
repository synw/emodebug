import 'package:emodebug/emodebug.dart';

//const EmoDebug debug = EmoDebug();
const CustomEmoDebug debug = CustomEmoDebug();

class CustomEmoDebug extends EmoDebug {
  const CustomEmoDebug();

  void crash(dynamic obj, [String domain]) => emo("💥", obj, domain);

  void recovery(dynamic obj, [String domain]) => emo("👍", obj, domain);
}

void main() {
  _printLines(1);
  debug.init("Initializing");
  _printLines(3);
  debug.ok("Everything is ok");
  _printLines(2);
  debug.state("A state operation");
  _printLines(1);
  debug.save("Saving something");
  _printLines(2);
  debug.delete("Deleting something");
  _printLines(3);
  debug.update("Updating something");
  _printLines(2);
  _printLines(1);
  final data = {"foo": "bar"};
  debug.data(data, "some data");
  _printLines(2);
  debug.crash("A crash occured!!!");
  _printLines(4);
  debug.recovery("Recovery successful");
  _printLines(3);
  debug.emo("🏁", "Finish");
}

var _i = 1;

void _printLines(int n) {
  var i = 0;
  while (i < n) {
    print("[$_i] Normal debug message flow message");
    ++i;
    ++_i;
  }
}

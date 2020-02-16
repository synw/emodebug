# Emodebug

[![pub package](https://img.shields.io/pub/v/emodebug.svg)](https://pub.dartlang.org/packages/emodebug)

Emoji based semantic debuging:

- **Debug the state** and execution flow of your program using familiar idioms
- Easy implementation of **custom debug methods**: extend the `EmoDebug` class to create your own methods

Note: this is not for error management, you can use [Err](https://github.com/synw/err) and [ErrRouter](https://github.com/synw/err_router) to manage the error flow.

Looking at the console you get an intuitive global view on the execution flow: 

![Screenshot](img/screenshot.png)

## Usage

### Existing debug methods

   ```dart
   import 'package:emodebug/emodebug.dart';

   const EmoDebug debug = EmoDebug();

   // use an existing method
   debug.save("Saving something");
   // or from an emoji using any object or a string
   debug.emo("📢", obj);
   ```

Available methods:

   ```dart
   final msg = "The debug message";
  /// A debug message for a state operation
  debug.state(msg);

  /// A debug message for a save operation
  debug.save(msg);

  /// A debug message for a delete operation
  debug.delete(msg);

  /// A debug message for a database query
  debug.query(msg);

  /// A debug message for a dataset
  debug.data(msg);

  /// A debug message representing a line
  debug.line(msg);

  /// A debug message for an initialization
  debug.init(msg);

  /// A debug message for an update
  debug.update(msg);

  /// A debug message for an ok state
  debug.ok(msg);

  /// A debug message for an build
  debug.build(msg);

  /// A debug message for parameters
  debug.param(msg);

  /// A debug message for a class constructor
  debug.constructor(msg);

  /// A debug message for a time related operation
  debug.time(msg);
  ```

### Implement custom debug methods

   ```dart
   const CustomEmoDebug debug = CustomEmoDebug();

   class CustomEmoDebug extends EmoDebug {
     const CustomEmoDebug();
   
     void crash(dynamic obj, [String domain]) => emo("💥", obj, domain);
   
     void recovery(dynamic obj, [String domain]) => emo("👍", obj, domain);
   }

   // in the code
   debug.crash("A crash occured!!!");
   debug.recovery("Recovery successful");
   ```

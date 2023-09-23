import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';

class LockScreenPage extends StatefulWidget {
  const LockScreenPage({super.key});

  @override
  State<LockScreenPage> createState() => _LockScreenPageState();
}

class _LockScreenPageState extends State<LockScreenPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenLock(
      correctString: '1234',
      onUnlocked: Navigator.of(context).pop,
    );
  }
}

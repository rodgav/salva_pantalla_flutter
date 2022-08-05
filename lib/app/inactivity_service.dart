import 'dart:async';

import 'package:flutter/material.dart';
import 'package:salva_pantalla/block_page.dart';

class InactivityService {
  static const _timeSeconds = 180;
  Timer? _timer;
  BuildContext? _context;

  void initTimer(BuildContext context, VoidCallback blockPop) async {
    _context = context;
    if (_timer != null) cancelTimer();
    _timer = Timer(const Duration(seconds: _timeSeconds), () {
      finishTimer(blockPop);
    });
  }

  void cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  finishTimer(VoidCallback blockPop) {
    cancelTimer();
    if (_context != null) {
      showDialog(
          context: _context!,
          builder: (BuildContext context) {
            return Dialog(
              insetPadding: const EdgeInsets.all(0),
              child: BlockPage(blockPop),
            );
          });
    }
  }
}

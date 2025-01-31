import 'dart:async';
import 'dart:ui';

class SearchCases {
  Timer? timer;

  debounce(VoidCallback action) {
    if (timer?.isActive ?? false) {
      timer!.cancel();
    }
    timer = Timer(const Duration(seconds: 1), () => action());
  }
}
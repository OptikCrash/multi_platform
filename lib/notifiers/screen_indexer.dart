import 'package:flutter/foundation.dart';

class ScreenIndexProvider extends ChangeNotifier {
  ScreenIndexProvider({this.startIndex = 0, this.indexCount = 3}) {
    _currentIndex = startIndex;
  }
  int startIndex;
  int indexCount;

  int _currentIndex = 0;
  final Set<int> _indexRecord = <int>{};

  int get currentIndex => _currentIndex;

  void advanceToIndex(int index) {
    _currentIndex = index;
    _indexRecord.add(index);
    notifyListeners();
  }

  void backPopIndex() {
    if (_currentIndex < indexCount) {
      _currentIndex = 0;
      notifyListeners();
      _indexRecord.clear();
    } else {
      _currentIndex = _getBackIndex();
      notifyListeners();
    }
  }

  int _getBackIndex() {
    int lastIndex = _indexRecord.last;
    if (lastIndex == _currentIndex) {
      _indexRecord.remove(lastIndex);
      return _getBackIndex();
    }
    return lastIndex;
  }
}

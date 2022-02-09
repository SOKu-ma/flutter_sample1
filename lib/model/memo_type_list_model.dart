import 'package:riverpod/riverpod.dart';

final strMemoGroupNameProvider = StateProvider((ref) => '');
final strMemoDetailProvider = StateProvider((ref) => '');
// final isShareToggleProvider = StateProvider((ref) => false);
final isShareToggleProvider =
    StateNotifierProvider<ShareToggle, bool>((ref) => ShareToggle(false));

class ShareToggle extends StateNotifier<bool> {
  ShareToggle(bool flg) : super(flg);

  void toggle(bool flg) {
    if (!flg) {
      state = false;
    } else {
      state = true;
    }
  }
}

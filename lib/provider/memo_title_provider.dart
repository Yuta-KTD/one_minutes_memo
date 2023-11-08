import 'package:flutter_riverpod/flutter_riverpod.dart';

// NOTE: StateProviderはrivepod_generatorで生成できない、今後対応される予定もないらしい
// https://github.com/rrousselGit/riverpod/discussions/1725
final memoTitleProvier = StateProvider.autoDispose<String?>((ref) => null);

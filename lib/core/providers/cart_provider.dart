import 'package:gebly/core/models/item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cartProvider = StateProvider((ref) => <Item, int>{});

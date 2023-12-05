import 'package:gebly/core/models/item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cart = Provider((ref) => List<Item>.empty(growable: true));

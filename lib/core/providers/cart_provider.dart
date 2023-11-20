import 'package:gebly/core/models/food.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cart = Provider((ref) => List<Food>.empty(growable: true));

part of 'product_counter_bloc.dart';

abstract class ProductCounterEvent {}

class IncrementCounter extends ProductCounterEvent {}

class DecrementCounter extends ProductCounterEvent {}

class ResetCounter extends ProductCounterEvent {}

import 'package:equatable/equatable.dart';

abstract class Failure with EquatableMixin {
  final String? message;
  DateTime? _created;

  Failure([this.message]) {
    _created = DateTime.now();
  }

  @override
  List<Object?> get props => [message, _created];
}

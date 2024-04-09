import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class BLOCEvent extends Equatable {
  const BLOCEvent();
}

class InitializeBLOCEvent extends BLOCEvent {
  @override
  List<Object?> get props => [];

  const InitializeBLOCEvent();
}

class LoadLocationsEvent extends BLOCEvent {
  @override
  List<Object?> get props => [];

  const LoadLocationsEvent();
}

class LoadEpisodesEvent extends BLOCEvent {
  @override
  List<Object?> get props => [];

  const LoadEpisodesEvent();
}

class LoadCharactersEvent extends BLOCEvent {
  @override
  List<Object?> get props => [];

  const LoadCharactersEvent();
}

class RemoveLocationEvent extends BLOCEvent {
  @override
  List<Object?> get props => [id];

  final int id;

  const RemoveLocationEvent({required this.id});
}

class RemoveEpisodeEvent extends BLOCEvent {
  @override
  List<Object?> get props => [id];

  final int id;

  const RemoveEpisodeEvent({required this.id});
}

class RemoveCharacterEvent extends BLOCEvent {
  @override
  List<Object?> get props => [id];

  final int id;

  const RemoveCharacterEvent({required this.id});
}

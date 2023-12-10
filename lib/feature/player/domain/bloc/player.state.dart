abstract interface class PlayerBlocStates {
  const PlayerBlocStates();
}

final class PlayerBlocCommonState extends PlayerBlocStates {
  final bool isActive;

  const PlayerBlocCommonState({required this.isActive});

  PlayerBlocCommonState copyWith({
    bool? isActive,
  }) {
    return PlayerBlocCommonState(
      isActive: isActive ?? this.isActive,
    );
  }
}

final class PlayerBlocLoadingState extends PlayerBlocStates {
  const PlayerBlocLoadingState();
}

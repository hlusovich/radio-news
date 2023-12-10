abstract interface class PlayerEvents {
  const PlayerEvents();
}

final class PlayerClickPlayButton extends PlayerEvents {}

final class PlayerClickChangeButton extends PlayerEvents {
  const PlayerClickChangeButton();
}

final class PlayerChangeLoadingStatus extends PlayerEvents {
  final bool isLoading;

  const PlayerChangeLoadingStatus({required this.isLoading});
}

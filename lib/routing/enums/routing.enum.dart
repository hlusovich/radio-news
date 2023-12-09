enum RoutingEnum {
  home,
  player,
  playerList;

  get name {
    switch (this) {
      case home:
        return '/';
      case player:
        return '/player';
      case playerList:
        return '/player_list';
    }
  }
}

abstract class Assets {
  const Assets._();

  // ignore: library_private_types_in_public_api
  static _Icons get icons => const _Icons();
  // ignore: library_private_types_in_public_api
  static _Images get images => const _Images();
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super('assets/icons');

  String get homeMenu => '$basePath/menu_icons/ic_home_menu.svg';
  
  String get cartMenu => '$basePath/menu_icons/ic_cart_menu.svg';

  String get favoritesMenu => '$basePath/menu_icons/ic_favorites_menu.svg';

  String get calendarMenu => '$basePath/menu_icons/ic_calendar_menu.svg';

  String get recipesMenu => '$basePath/menu_icons/ic_recipes_menu.svg';

  String get searchMenu => '$basePath/menu_icons/ic_search_menu.svg';

  String get settingsMenu => '$basePath/menu_icons/ic_settings_menu.svg';

  String get appLogo => '$basePath/ic_app_logo.svg';

}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');
}

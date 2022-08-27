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

  String get like => '$basePath/ic_like.svg';

  String get share => '$basePath/ic_share.svg';

  String get comment => '$basePath/ic_comment.svg';

  String get ingredients => '$basePath/ic_ingredients.svg';

  String get variation => '$basePath/ic_variation.svg';

  String get peoples => '$basePath/ic_peoples.svg';

  String get calendar => '$basePath/ic_calendar.svg';

  String get recipeTime => '$basePath/recipe_info_icons/ic_recipe_time.svg';

  String get recipeView => '$basePath/recipe_info_icons/ic_recipe_view.svg';

  String get bakeryOne => '$basePath/recipe_info_icons/ic_bakery_one.png';

  String get flagOne => '$basePath/recipe_info_icons/ic_flag_one.png';

  String get gluttenOne => '$basePath/recipe_info_icons/ic_glutten_one.png';

  String get moreOne => '$basePath/recipe_info_icons/ic_more_one.png';

  String get pancakeOne => '$basePath/recipe_info_icons/ic_pancake_one.png';

  String get stoveOne => '$basePath/recipe_info_icons/ic_stove_one.png';

  String get timeOne => '$basePath/recipe_info_icons/ic_time_one.png';

  String get backArrow => '$basePath/ic_back_arrow.svg';

  String get search => '$basePath/ic_search.svg';

  String get playBtn => '$basePath/ic_play_btn.svg';

  //jalolxon
  String get icBack => '$basePath/ic_back.svg';

  String get icInfo => '$basePath/ic_info.svg';

  String get icAdd => '$basePath/ic_add.svg';

  String get icAddBlack => '$basePath/ic_add_black.svg';

  String get icRemove => '$basePath/ic_remove.svg';

  String get icRemoveBlack => '$basePath/ic_remove_black.svg';

  String get icScanner => '$basePath/ic_scanner.svg';

  String get icEdit => '$basePath/ic_edit.svg';

  String get icDelete => '$basePath/ic_delete.svg';

  String get icCheck => '$basePath/ic_check.svg';
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');

  String get userAvatar1 => "$basePath/img_user1.jpeg";

  String get userAvatar2 => "$basePath/img_user2.jpeg";

  String get recipeChicken => "$basePath/img_chicken.png";

  String get recipeMedovik => "$basePath/img_classic_medovik.png";

  String get recipePrepaireOne => "$basePath/im_prepaire_one.png";
}

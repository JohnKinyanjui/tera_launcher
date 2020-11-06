
import 'package:device_apps/device_apps.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';

ApplicationCategory getCategory(index){
  if (index ==0) {
    return ApplicationCategory.social;
  }else if(index == 1){
    return ApplicationCategory.productivity;
  }else if(index == 2){
    return ApplicationCategory.game;
  }else if(index == 3){
    return ApplicationCategory.image;
  }else if(index == 4){
    return ApplicationCategory.video;
  }else if(index == 5){
    return ApplicationCategory.audio;
  }else if(index == 6){
    return ApplicationCategory.maps;
  }else if(index == 7){
    return ApplicationCategory.news;
  }else if(index == 8){
    return ApplicationCategory.undefined;
  }
}

String getCategoryLabel(index){
  if (index ==0) {
    return "Social";
  }else if(index == 1){
    return "Productivity";
  }else if(index == 2){
    return "Games";
  }else if(index == 3){
    return "Images";
  }else if(index == 4){
    return "Video";
  }else if(index == 5){
    return "Audio";
  }else if(index == 6){
    return "Maps";
  }else if(index == 7){
    return "News";
  }else if(index == 8){
    return "Undefined";
  }
}

IconData getCategoryIcon(index){
  if (index ==0) {
    return FluentSystemIcons.ic_fluent_chat_regular;
  }else if(index == 1){
    return FluentSystemIcons.ic_fluent_edit_regular;
  }else if(index == 2){
    return FluentSystemIcons.ic_fluent_games_regular;
  }else if(index == 3){
    return FluentSystemIcons.ic_fluent_image_regular;
  }else if(index == 4){
    return FluentSystemIcons.ic_fluent_video_regular;
  }else if(index == 5){
    return FluentSystemIcons.ic_fluent_music_regular;
  }else if(index == 6){
    return FluentSystemIcons.ic_fluent_map_regular;
  }else if(index == 7){
    return FluentSystemIcons.ic_fluent_news_regular;
  }else if(index == 8){
    return FluentSystemIcons.ic_fluent_apps_regular;
  }
}
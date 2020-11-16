import 'package:device_apps/device_apps.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tera_launcher/components/app_category.dart';

enum AppCategory {social,productivity, games, images, videos, audio, maps, news, others}

List<Application> apps = [];

class AppsBloc extends Bloc<AppCategory,List<Application>> {
  AppsBloc(List<Application> initialState) : super(initialState);

  @override
  Stream<List<Application>> mapEventToState(AppCategory event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
  
}
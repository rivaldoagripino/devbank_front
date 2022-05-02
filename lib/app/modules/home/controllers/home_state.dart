import 'package:devbank_front/app/modules/home/models/extract_response_model.dart';

abstract class HomeState {}

class HomeStateStart implements HomeState {}

class HomeStateLoading implements HomeState {}

class HomeStateSuccess implements HomeState {
  final ExtractResponse extractResponse;

  HomeStateSuccess({
    required this.extractResponse,
  });
}

class HomeStateFailed implements HomeState {}

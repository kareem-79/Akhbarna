import 'package:akhbarna/features/layout/home/presentation/cubit/state/latest_news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../domain/use_case/get_latest_news_use_case.dart';

@lazySingleton
class LatestNewsCubit extends Cubit<LatestNewsState> {
  final GetLatestNewsUseCase getLatestNewsUseCase;

  LatestNewsCubit({required this.getLatestNewsUseCase})
    : super(LatestNewsInitial());

  Future<void> getLatestNews({required int top}) async {
    emit(LatestNewsLoading());

    final result = await getLatestNewsUseCase(top: top);

    result.fold(
      (Failure failure) {
        emit(LatestNewsError(message: failure.message));
      },

      (articles) {
        emit(LatestNewsSuccess(articles: articles));
      },
    );
  }
}

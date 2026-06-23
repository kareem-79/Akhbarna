import 'package:akhbarna/features/layout/home/presentation/cubit/state/most_read_news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/failure.dart';
import '../../domain/use_case/get_most_read_news_use_case.dart';

@lazySingleton
class MostReadNewsCubit extends Cubit<MostReadNewsState> {
  final GetMostReadNewsUseCase getMostReadNewsUseCase;

  MostReadNewsCubit({required this.getMostReadNewsUseCase})
    : super(MostReadNewsInitial());

  Future<void> getMostReadNews({required int top}) async {
    emit(MostReadNewsLoading());

    final result = await getMostReadNewsUseCase(top: top);

    result.fold(
      (Failure failure) {
        emit(MostReadNewsError(message: failure.message));
      },

      (articles) {
        emit(MostReadNewsSuccess(articles: articles));
      },
    );
  }
}

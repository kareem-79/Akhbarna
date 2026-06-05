import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/failure.dart';
import '../../domain/use_case/get_most_read_news_use_case.dart';
import 'most_read_news_state.dart';

@injectable
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

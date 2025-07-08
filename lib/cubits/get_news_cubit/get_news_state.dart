class NewsStates {}

class NewsSucess extends NewsStates {}

class NewsLoading extends NewsStates {}

class NewsFaluire extends NewsStates {
  final String errorMessage;

  NewsFaluire(this.errorMessage);
}

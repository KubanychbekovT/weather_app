import 'package:http/http.dart' as http;

abstract class Failure {
  final String error;
  
  const Failure(this.error);
}

class ServerFailure extends Failure {
  ServerFailure(super.error);
  factory ServerFailure.fromHttpResponse(http.Response response) {
    switch (response.statusCode) {
      case 401:
      case 402:
      case 403:
        return ServerFailure(response.body);
      case 404:
        return ServerFailure('Your request not found, Please try later!');
      case 500:
        return ServerFailure('Internal server error, Please try later!');
      default:
        return ServerFailure('Opps there was an error, Please try again!');
    }
  }
}
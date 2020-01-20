import 'package:equatable/equatable.dart';

abstract class Failure with EquatableMixin{
  List properties = const<dynamic>[];
  Failure([properties]);

  @override
  List<Object> get props {
    return[properties];
  }

}

//General failures
class ServerFailure extends Failure {
//final String extraProperty;

/*
* @override
  List<Object> get props => super.props..addAll([extraProperty]);*/

}

class CacheFailure extends Failure {


}

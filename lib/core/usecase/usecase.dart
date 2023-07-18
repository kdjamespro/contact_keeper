abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

// class ExampleWithoutParams extends UseCase<int, void> {
//   @override
//   Future<int> call(void params) async => 42;
// }


// class ExampleWithoutReturnType extends UseCase<void, String> {
//   @override
//   Future<void> call(String params) async => print(params);
// }
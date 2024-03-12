import 'package:stub_gen/annotations.dart';
import 'package:stub_gen/stubbables.dart';

part 'sample.g.dart';

@StubGen(defaultValues: {StubbableTypes.int: 10})
class Sample {
  final String name;
  final int age;
  final double height;
  final bool isMale;

  const Sample(
    this.name,
    this.age,
    this.height,
    this.isMale,
  );
}

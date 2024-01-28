import 'package:stub_kit/annotations.dart';
import 'package:test/test.dart';

part 'primitive_test.g.dart';

@Stub(intDefault: 1234)
class IntTarget {
  int value;
  IntTarget(this.value);
}

@Stub(stringDefault: "Hello World")
class StringTarget {
  String value;
  StringTarget(this.value);
}

@Stub()
class DoubleTarget {
  double value;
  DoubleTarget(this.value);
}

@Stub()
class BoolTarget {
  bool value;
  BoolTarget(this.value);
}

@Stub(intDefault: 123456)
class ListTarget {
  List<int> value;
  ListTarget(this.value);
}

void main() {
  test("constructor with int", () {
    final target = IntTargetStub.stub();
    expect(target.value, 1234);
  });
  test("constructor with String", () {
    final target = StringTargetStub.stub();
    expect(target.value, "Hello World");
  });
  test("constructor with double", () {
    final target = DoubleTargetStub.stub();
    expect(target.value, 1.0);
  });
  test("constructor with bool", () {
    final target = BoolTargetStub.stub();
    expect(target.value, false);
  });

  test("constructor with List<int>", () {
    final target = ListTargetStub.stub();
    expect(target.value, [123456]);
  });
}

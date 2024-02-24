import 'package:analyzer/dart/element/element.dart';
import 'package:stub_kit/src/default_values.dart';
import 'package:stub_kit/src/parsers/parameter_parser.dart';
import 'package:stub_kit/src/parsers/parser.dart';

class ConstructorParser with Parser {
  final ClassElement classElement;
  final ConstructorElement constructorElement;

  ConstructorParser(this.classElement, this.constructorElement);

  @override
  String parse({required DefaultValues defaultValues}) {
    final className = classElement.name;
    final constructorName = constructorElement.name;
    if (constructorName.startsWith("_")) {
      return "";
    }
    final parameters = <ParameterParser>[];
    for (final parameter in constructorElement.parameters) {
      parameters.add(ParameterParser(parameter));
    }
    return """
  static $className ${constructorName.isEmpty ? "stub" : "${constructorName}Stub"}({
    ${parameters.map((e) => e.parseForArgument(defaultValues: defaultValues)).where((element) => element.isNotEmpty).join(',\n')}
  }) => $className${constructorName.isEmpty ? "" : ".$constructorName"}(
    ${parameters.map((e) => e.parse(defaultValues: defaultValues)).join(',\n')}
  );
""";
  }
}

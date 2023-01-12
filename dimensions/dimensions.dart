void main(List<String> args) {}

abstract class Widget {}

abstract class Context {
  late double width;
  late double height;
}

class Dimensions {
  Context context;

  Dimensions(this.context);

  Widget widget(Map<Breakpoints, Widget> map) {
    var size = this.context.width; // obter tamanho via context

    Widget? component;

    for (var key in map.keys) {
      switch (key) {
        case Breakpoints.sm:
          component = map[key];
          break;
        default:
      }
    }

    return component == null ? Row() : component;
  }
}

class Row implements Widget {}

enum Breakpoints {
  xs,
  sm,
  md,
  lg,
  xl,
}

class ThemeBreakpoints {
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;

  const ThemeBreakpoints({
    this.xs = 0,
    this.sm = 480,
    this.md = 768,
    this.lg = 920,
    this.xl = 1200,
  });
}

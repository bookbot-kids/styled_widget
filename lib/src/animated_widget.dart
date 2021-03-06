part of 'widget.dart';

class _AnimatedDecorationBox extends ImplicitlyAnimatedWidget {
  /// The [curve] and [duration] arguments must not be null.
  _AnimatedDecorationBox({
    Key key,
    this.decoration,
    this.position,
    this.child,
    Curve curve = Curves.linear,
    @required Duration duration,
    VoidCallback onEnd,
  })  : assert(decoration == null || decoration.debugAssertIsValid()),
        super(
          key: key,
          curve: curve,
          duration: duration,
          onEnd: onEnd,
        );

  /// The [child] contained by the container.
  ///
  /// If null, and if the [constraints] are unbounded or also null, the
  /// container will expand to fill all available space in its parent, unless
  /// the parent provides unbounded constraints, in which case the container
  /// will attempt to be as small as possible.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// The decoration to paint behind the [child].
  ///
  /// A shorthand for specifying just a solid color is available in the
  /// constructor: set the `color` argument instead of the `decoration`
  /// argument.
  final Decoration decoration;

  final DecorationPosition position;

  @override
  _AnimatedDecorationBoxState createState() => _AnimatedDecorationBoxState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<Decoration>('bg', decoration, defaultValue: null));
    // TODO: debug [position]?
  }
}

class _AnimatedDecorationBoxState
    extends AnimatedWidgetBaseState<_AnimatedDecorationBox> {
  DecorationTween _decoration;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _decoration = visitor(_decoration, widget.decoration,
        (dynamic value) => DecorationTween(begin: value));
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      child: widget.child,
      decoration: _decoration?.evaluate(animation),
      position: widget.position,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<DecorationTween>('bg', _decoration,
        defaultValue: null));
  }
}

class _AnimatedConstrainedBox extends ImplicitlyAnimatedWidget {
  /// The [curve] and [duration] arguments must not be null.
  _AnimatedConstrainedBox({
    Key key,
    this.constraints,
    this.child,
    Curve curve = Curves.linear,
    @required Duration duration,
    VoidCallback onEnd,
  })  : assert(constraints == null || constraints.debugAssertIsValid()),
        super(
          key: key,
          curve: curve,
          duration: duration,
          onEnd: onEnd,
        );

  /// The [child] contained by the container.
  ///
  /// If null, and if the [constraints] are unbounded or also null, the
  /// container will expand to fill all available space in its parent, unless
  /// the parent provides unbounded constraints, in which case the container
  /// will attempt to be as small as possible.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// Additional constraints to apply to the child.
  ///
  /// The constructor `width` and `height` arguments are combined with the
  /// `constraints` argument to set this property.
  ///
  /// The [padding] goes inside the constraints.
  final BoxConstraints constraints;

  @override
  _AnimatedConstrainedBoxState createState() => _AnimatedConstrainedBoxState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BoxConstraints>(
        'constraints', constraints,
        defaultValue: null, showName: false));
  }
}

class _AnimatedConstrainedBoxState
    extends AnimatedWidgetBaseState<_AnimatedConstrainedBox> {
  BoxConstraintsTween _constraints;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _constraints = visitor(_constraints, widget.constraints,
        (dynamic value) => BoxConstraintsTween(begin: value));
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      child: widget.child,
      constraints: _constraints?.evaluate(animation),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<BoxConstraintsTween>(
        'constraints', _constraints,
        showName: false, defaultValue: null));
  }
}

class _AnimatedTransform extends ImplicitlyAnimatedWidget {
  /// Creates a container that animates its parameters implicitly.
  ///
  /// The [curve] and [duration] arguments must not be null.
  _AnimatedTransform({
    this.transform,
    this.origin,
    this.alignment,
    this.transformHitTests = true,
    this.child,
    Curve curve = Curves.linear,
    @required Duration duration,
  }) : super(
          curve: curve,
          duration: duration,
        );

  /// The [child] contained by the container.
  ///
  /// If null, and if the [constraints] are unbounded or also null, the
  /// container will expand to fill all available space in its parent, unless
  /// the parent provides unbounded constraints, in which case the container
  /// will attempt to be as small as possible.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  final Offset origin;

  final AlignmentGeometry alignment;

  final bool transformHitTests;

  /// The transformation matrix to apply before painting the container.
  final Matrix4 transform;

  @override
  _AnimatedTransformState createState() => _AnimatedTransformState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AlignmentGeometry>(
        'alignment', alignment,
        showName: false, defaultValue: null));
    properties.add(ObjectFlagProperty<Matrix4>.has('transform', transform));
    // TODO: debug [origin], [transformHitTest]?
  }
}

class _AnimatedTransformState
    extends AnimatedWidgetBaseState<_AnimatedTransform> {
  AlignmentGeometryTween _alignment;
  Matrix4Tween _transform;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _alignment = visitor(_alignment, widget.alignment,
        (dynamic value) => AlignmentGeometryTween(begin: value));
    _transform = visitor(_transform, widget.transform,
        (dynamic value) => Matrix4Tween(begin: value));
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      child: widget.child,
      transform: _transform?.evaluate(animation),
      alignment: _alignment?.evaluate(animation),
      origin: widget.origin,
      transformHitTests: widget.transformHitTests,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<AlignmentGeometryTween>(
        'alignment', _alignment,
        showName: false, defaultValue: null));
    description
        .add(ObjectFlagProperty<Matrix4Tween>.has('transform', _transform));
  }
}

class _AnimatedBorderRadius extends ImplicitlyAnimatedWidget {
  /// The [curve] and [duration] arguments must not be null.
  _AnimatedBorderRadius({
    Key key,
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    this.child,
    Curve curve = Curves.linear,
    @required Duration duration,
    VoidCallback onEnd,
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
          onEnd: onEnd,
        );

  /// The [child] contained by the container.
  ///
  /// If null, and if the [constraints] are unbounded or also null, the
  /// container will expand to fill all available space in its parent, unless
  /// the parent provides unbounded constraints, in which case the container
  /// will attempt to be as small as possible.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  @override
  _AnimatedBorderRadiusState createState() => _AnimatedBorderRadiusState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    //TODO: debug [topLeft], [topRight], [bottomLeft], [bottomRight]
  }
}

class _AnimatedBorderRadiusState
    extends AnimatedWidgetBaseState<_AnimatedBorderRadius> {
  Tween<double> _topLeft;
  Tween<double> _topRight;
  Tween<double> _bottomLeft;
  Tween<double> _bottomRight;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _topLeft = visitor(_topLeft, widget.topLeft,
        (dynamic value) => Tween<double>(begin: value));
    _topRight = visitor(_topRight, widget.topRight,
        (dynamic value) => Tween<double>(begin: value));
    _bottomLeft = visitor(_bottomLeft, widget.bottomLeft,
        (dynamic value) => Tween<double>(begin: value));
    _bottomRight = visitor(_bottomRight, widget.bottomRight,
        (dynamic value) => Tween<double>(begin: value));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: widget.child,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(_topLeft.evaluate(animation)),
        topRight: Radius.circular(_topRight.evaluate(animation)),
        bottomLeft: Radius.circular(_bottomLeft.evaluate(animation)),
        bottomRight: Radius.circular(_bottomRight.evaluate(animation)),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    //TODO: debug [_topLeft], [_topRight], [_bottomLeft], [_bottomRight]
  }
}

class _AnimatedBackgroundBlur extends ImplicitlyAnimatedWidget {
  /// Creates a widget that animates its opacity implicitly.
  ///
  /// The [opacity] argument must not be null and must be between 0.0 and 1.0,
  /// inclusive. The [curve] and [duration] arguments must not be null.
  const _AnimatedBackgroundBlur({
    Key key,
    this.child,
    @required this.sigma,
    Curve curve = Curves.linear,
    @required Duration duration,
    VoidCallback onEnd,
    this.alwaysIncludeSemantics = false,
  })  : assert(sigma != null && sigma >= 0.0),
        super(
          key: key,
          curve: curve,
          duration: duration,
          onEnd: onEnd,
        );

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  final double sigma;

  /// Whether the semantic information of the children is always included.
  ///
  /// Defaults to false.
  ///
  /// When true, regardless of the opacity settings the child semantic
  /// information is exposed as if the widget were fully visible. This is
  /// useful in cases where labels may be hidden during animations that
  /// would otherwise contribute relevant semantics.
  final bool alwaysIncludeSemantics;

  @override
  _AnimatedBackgroundBlurState createState() => _AnimatedBackgroundBlurState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('background blur', sigma));
  }
}

class _AnimatedBackgroundBlurState
    extends ImplicitlyAnimatedWidgetState<_AnimatedBackgroundBlur> {
  Tween<double> _sigma;
  Animation<double> _sigmaAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _sigma = visitor(
        _sigma, widget.opacity, (dynamic value) => Tween<double>(begin: value));
  }

  @override
  void didUpdateTweens() {
    _sigmaAnimation = animation.drive(_sigma);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _sigmaAnimation,
      child: widget.child,
      alwaysIncludeSemantics: widget.alwaysIncludeSemantics,
    );
  }
}

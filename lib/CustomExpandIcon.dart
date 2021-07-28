// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomExpandIcon extends StatefulWidget {
  /// Creates an [CustomExpandIcon] with the given padding, and a callback that is
  /// triggered when the icon is pressed.
  const CustomExpandIcon({
    Key? key,
    required this.myIcon,
    required this.isRotation,
    required this.isSlide,
    this.isExpanded = false,
    this.size = 24.0,
    required this.onPressed,
    this.padding = const EdgeInsets.all(8.0),
    this.color,
    this.disabledColor,
    this.expandedColor,
  }) : assert(isExpanded != null),
        assert(size != null),
        assert(padding != null),
        super(key: key);

  /// Whether the icon is in an expanded state.
  ///
  /// Rebuilding the widget with a different [isExpanded] value will trigger
  /// the animation, but will not trigger the [onPressed] callback.
  final bool isExpanded;

  final Icon myIcon;
  final bool isRotation;
  final bool isSlide;
  final double size;
  final ValueChanged<bool>? onPressed;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final Color? disabledColor;
  final Color? expandedColor;

  @override
  State<CustomExpandIcon> createState() => _CustomExpandIconState();
}

class _CustomExpandIconState extends State<CustomExpandIcon> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<Offset> _iconSlides;

  static final Animatable<double> _iconTurnTween = Tween<double>(begin: 0.0, end: 0.5)
      .chain(CurveTween(curve: Curves.fastOutSlowIn));

  static final Animatable<Offset> _iconSlideTween = Tween(begin: Offset.zero, end: Offset(0, -1))
      .chain(CurveTween(curve: Curves.easeInQuint));

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: kThemeAnimationDuration, vsync: this);
    _iconTurns = _controller.drive(_iconTurnTween);
    _iconSlides = _controller.drive(_iconSlideTween);
    // If the widget is initially expanded, rotate the icon without animating it.
    if (widget.isExpanded) {
      _controller.value = math.pi;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomExpandIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      if (widget.isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  void _handlePressed() {
    widget.onPressed?.call(widget.isExpanded);
  }

  Color get _iconColor {
    if (widget.isExpanded && widget.expandedColor != null) {
      return widget.expandedColor!;
    }

    if (widget.color != null) {
      return widget.color!;
    }

    switch(Theme.of(context).brightness) {
      case Brightness.light:
        return Colors.black54;
      case Brightness.dark:
        return Colors.white60;
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final String onTapHint = widget.isExpanded ? localizations.expandedIconTapHint : localizations.collapsedIconTapHint;

    return Semantics(
      onTapHint: widget.onPressed == null ? null : onTapHint,
      child: Container(
        width: 50,
        height: 50,
        child: InkWell(
          customBorder: CircleBorder(),
          onTap: widget.onPressed == null ? null : _handlePressed,
          child: widget.isRotation
          ? RotationTransition(
            turns: _iconTurns,
            child: widget.myIcon,
            )
          : SlideTransition(
            position: _iconSlides,
            child: widget.myIcon
          ),
        ),
      ),
    );
  }
}
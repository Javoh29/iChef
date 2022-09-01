import 'package:flutter/widgets.dart';

import 'controller.dart';

/// Signature for [CustomSlidableNotification] listeners.
///
/// Used by [CustomSlidableNotificationListener.onNotification].
typedef SlidableNotificationCallback = void Function(
  CustomSlidableNotification notification,
);

/// A [Slidable] notification that can bubble up the widget tree.
///
/// You can determine the type of a notification using the `is` operator to
/// check the [runtimeType] of the notification.
///
/// To listen for notifications in a subtree, use a
/// [CustomSlidableNotificationListener].
///
/// To send a notification, call [dispatch] on the notification you wish to
/// send. The notification will be delivered to the closest
/// [CustomSlidableNotificationListener] widget.
@Deprecated('Use SlidableAutoCloseNotification instead')
@immutable
class CustomSlidableNotification {
  /// Abstract const constructor. This constructor enables subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const CustomSlidableNotification({
    required this.tag,
  });

  /// A tag representing the [Slidable] from which the notification is sent.
  final Object? tag;

  /// Start bubbling this notification at the given build context.
  ///
  /// The notification will be delivered to the closest
  /// [CustomSlidableNotificationListener] widget.
  /// If the [BuildContext] is null, the notification is not dispatched.
  void dispatch(BuildContext context, CustomSlidableController controller) {
    final scope = context
        .getElementForInheritedWidgetOfExactType<
            _SlidableNotificationListenerScope>()
        ?.widget as _SlidableNotificationListenerScope?;

    scope?.state.acceptNotification(controller, this);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is CustomSlidableNotification && other.tag == tag;
  }

  @override
  int get hashCode => tag.hashCode;

  @override
  String toString() => 'SlidableNotification(tag: $tag)';
}

/// A specific [CustomSlidableNotification] which holds the current ratio value.
@immutable
@Deprecated('Use SlidableAutoCloseNotification instead')
class CustomSlidableRatioNotification extends CustomSlidableNotification {
  /// Creates a [CustomSlidableRatioNotification].
  const CustomSlidableRatioNotification({
    required Object? tag,
    required this.ratio,
  }) : super(tag: tag);

  /// The ratio value of the [CustomSlidableController].
  final double ratio;

  @override
  bool operator ==(Object other) {
    return super == other &&
        other is CustomSlidableRatioNotification &&
        other.ratio == ratio;
  }

  @override
  int get hashCode => hashValues(tag, ratio);

  @override
  String toString() => 'SlidableRatioNotification(tag: $tag, ratio: $ratio)';
}

/// A widget that listens for [CustomSlidableNotification]s bubbling up the tree.
///
/// To dispatch notifications, use the [CustomSlidableNotification.dispatch] method.
@Deprecated('Use SlidableAutoCloseBehavior instead')
class CustomSlidableNotificationListener extends StatefulWidget {
  /// Creates a [CustomSlidableNotificationListener].
  const CustomSlidableNotificationListener({
    Key? key,
    this.onNotification,
    this.autoClose = true,
    required this.child,
  })  : assert(
          autoClose || onNotification != null,
          'Either autoClose or onNotification must be set.',
        ),
        super(key: key);

  /// The widget directly below this widget in the tree.
  ///
  /// This is not necessarily the widget that dispatched the notification.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// Called when a notification of the appropriate arrives at this location in
  /// the tree.
  final SlidableNotificationCallback? onNotification;

  /// Whether to automatically close any [Slidable] with a given tag when
  /// another [Slidable] with the same tag opens.
  final bool autoClose;

  @override
  _CustomSlidableNotificationListenerState createState() =>
      _CustomSlidableNotificationListenerState();
}

class _CustomSlidableNotificationListenerState
    extends State<CustomSlidableNotificationListener> {
  final Map<Object?, CustomSlidableController> openControllers =
      <Object?, CustomSlidableController>{};

  void acceptNotification(
    CustomSlidableController controller,
    CustomSlidableNotification notification,
  ) {
    handleNotification(controller, notification);
    widget.onNotification?.call(notification);
  }

  void handleNotification(
    CustomSlidableController controller,
    CustomSlidableNotification notification,
  ) {
    if (widget.autoClose && !controller.closing) {
      // Automatically close the last controller saved with the same tag.
      final lastOpenController = openControllers[notification.tag];
      if (lastOpenController != null && lastOpenController != controller) {
        lastOpenController.close();
      }
      openControllers[notification.tag] = controller;
    }
  }

  void clearController(CustomSlidableController controller, Object? tag) {
    final lastOpenController = openControllers[tag];
    if (lastOpenController == controller) {
      openControllers.remove(tag);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _SlidableNotificationListenerScope(
      state: this,
      child: widget.child,
    );
  }
}

class _SlidableNotificationListenerScope extends InheritedWidget {
  const _SlidableNotificationListenerScope({
    Key? key,
    required this.state,
    required Widget child,
  }) : super(key: key, child: child);

  final _CustomSlidableNotificationListenerState state;

  @override
  bool updateShouldNotify(
      covariant _SlidableNotificationListenerScope oldWidget) {
    return oldWidget.state != state;
  }
}

// Internal use.
// ignore_for_file: public_member_api_docs
@Deprecated('Use SlidableAutoCloseNotificationSender instead')
class SlidableNotificationSender extends StatefulWidget {
  const SlidableNotificationSender({
    Key? key,
    required this.tag,
    required this.controller,
    required this.child,
  }) : super(key: key);

  final Object? tag;
  final CustomSlidableController controller;
  final Widget child;

  @override
  _SlidableNotificationSenderState createState() =>
      _SlidableNotificationSenderState();
}

class _SlidableNotificationSenderState
    extends State<SlidableNotificationSender> {
  _CustomSlidableNotificationListenerState? listenerState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final state = context
        .dependOnInheritedWidgetOfExactType<
            _SlidableNotificationListenerScope>()
        ?.state;
    if (state != listenerState) {
      if (state == null) {
        removeListeners();
      } else if (listenerState == null) {
        addListeners();
      }
      listenerState = state;
    }
  }

  @override
  void dispose() {
    if (listenerState != null) {
      removeListeners();
      listenerState!.clearController(widget.controller, widget.tag);
    }
    super.dispose();
  }

  void addListeners() {
    widget.controller.animation.addListener(handleRatioChanged);
  }

  void removeListeners() {
    widget.controller.animation.removeListener(handleRatioChanged);
  }

  void handleRatioChanged() {
    final controller = widget.controller;
    final notification = CustomSlidableRatioNotification(
      tag: widget.tag,
      ratio: controller.ratio,
    );
    listenerState!.acceptNotification(controller, notification);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

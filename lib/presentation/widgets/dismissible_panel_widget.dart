import 'package:flutter/widgets.dart';
import 'package:flutter_custom_slidable/controller.dart';
import 'package:flutter_custom_slidable/dismissible_pane_motions.dart';
import 'package:flutter_custom_slidable/slidable.dart';

import 'package:flutter_svg/svg.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_styles.dart';
import '../../config/constants/assets.dart';

const double _kDismissThreshold = 0.75;
const Duration _kDismissalDuration = Duration(milliseconds: 300);
const Duration _kResizeDuration = Duration(milliseconds: 300);

/// Signature used by [DismissiblePaneWidget] to give the application an opportunity
/// to confirm or veto a dismiss gesture.
///
/// Used by [DismissiblePaneWidget.confirmDismiss].
typedef ConfirmDismissCallback = Future<bool> Function();

/// A widget wich controls how a [Slidable] dismisses.
class DismissiblePaneWidget extends StatefulWidget {
  /// Creates a [DismissiblePaneWidget].
  ///
  /// The [onDismissed], [dismissThreshold], [dismissalDuration],
  /// [resizeDuration], [closeOnCancel], and [motion] arguments must not be
  /// null.
  ///
  /// The [dismissThreshold] must be between 0 and 1 (both exclusives).
  ///
  /// You must set the key of the enclosing [Slidable] to use this widget.
  const DismissiblePaneWidget({
    Key? key,
    required this.onDismissed,
    this.dismissThreshold = _kDismissThreshold,
    this.dismissalDuration = _kDismissalDuration,
    this.resizeDuration = _kResizeDuration,
    this.confirmDismiss,
    this.closeOnCancel = false,
    this.motion = const InversedDrawerMotion(),
  })  : assert(dismissThreshold > 0 && dismissThreshold < 1),
        super(key: key);

  /// The threshold from which a dismiss will be triggered if the user stops
  /// to drag the [Slidable].
  ///
  /// This value must be between 0 and 1 (both exclusives.)
  ///
  /// Defaults to 0.75.
  final double dismissThreshold;

  /// The amount of time the widget will spend to complete the dissmiss
  /// animation.
  ///
  /// Defaults to 300ms.
  final Duration dismissalDuration;

  /// The amount of time the widget will spend contracting before [onDismissed]
  /// is called.
  ///
  /// If null, the widget will not contract and [onDismissed] will be called
  /// immediately after the widget is dismissed.
  final Duration resizeDuration;

  /// Gives the app an opportunity to confirm or veto a pending dismissal.
  ///
  /// If the returned Future<bool> completes true, then this widget will be
  /// dismissed, otherwise it will be moved back to its original location.
  ///
  /// If the returned Future<bool> completes to false or null the [onDismissed]
  /// callback will not run.
  final ConfirmDismissCallback? confirmDismiss;

  /// Called when the widget has been dismissed, after finishing resizing.
  final VoidCallback onDismissed;

  /// Whether closing the [Slidable] if the app cancels the dismiss.
  final bool closeOnCancel;

  /// The widget which animates while the [Slidable] is currently dismissing.
  final Widget motion;

  @override
  _DismissiblePaneWidgetState createState() => _DismissiblePaneWidgetState();
}

class _DismissiblePaneWidgetState extends State<DismissiblePaneWidget> {
  CustomSlidableController? controller;

  @override
  void initState() {
    super.initState();
    assert(() {
      final slidable = context.findAncestorWidgetOfExactType<Slidable>()!;
      if (slidable.key == null) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary('DismissiblePane created on a Slidable without a Key.'),
          ErrorDescription(
            'The closest Slidable of DismissiblePane has been created without '
            'a Key.\n'
            'The key argument must not be null because Slidables are '
            'commonly used in lists and removed from the list when '
            'dismissed. Without keys, the default behavior is to sync '
            'widgets based on their index in the list, which means the item '
            'after the dismissed item would be synced with the state of the '
            'dismissed item. Using keys causes the widgets to sync according '
            'to their keys and avoids this pitfall.',
          ),
          ErrorHint(
            'To avoid this problem, set the key of the enclosing Slidable '
            'widget.',
          ),
        ]);
      }
      return true;
    }());
    controller = Slidable.of(context);
    controller!.dismissGesture.addListener(handleDismissGestureChanged);
  }

  @override
  void dispose() {
    controller!.dismissGesture.removeListener(handleDismissGestureChanged);
    super.dispose();
  }

  Future<void> handleDismissGestureChanged() async {
    final endGesture = controller!.dismissGesture.value!.endGesture;
    final position = controller!.animation.value;

    if (
    endGesture is OpeningGesture ||
        endGesture is StillGesture && position >= widget.dismissThreshold * 0.8) {
      debugPrint(position.toString());
      debugPrint(widget.dismissThreshold.toString());
      bool canDismiss = true;
      if (widget.confirmDismiss != null) {
        canDismiss = await widget.confirmDismiss!();
      }
      if (canDismiss) {
        controller!.dismiss(
          ResizeRequest(widget.resizeDuration, widget.onDismissed),
          duration: widget.dismissalDuration,
        );
      } else if (widget.closeOnCancel) {
        controller!.close();
      }
      return;
    }

    controller!.openCurrentActionPane();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.accentLight,
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(10),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerRight,
        children: [
          widget.motion,
          Row(
            children: [
              const Spacer(),
              Text(
                '??????????????',
                style: AppTextStyles.b4DemiBold
                    .copyWith(color: AppColors.baseLight.shade100),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SvgPicture.asset(Assets.icons.trash),
              ),
            ],
          )
        ],
      ),
    );
  }
}

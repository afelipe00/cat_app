import 'package:flutter/material.dart';

class StatsButton extends StatelessWidget {
  final String label;
  final Widget child;
  final Widget? loadingIcon;
  final bool isLoading;
  final double? width;
  final Function()? onPressed;

  const StatsButton({
    super.key,
    required this.label,
    required this.child,
    required this.onPressed,
    this.width,
    this.loadingIcon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width,
          child: IconButton.filled(
            onPressed: isLoading ? null : onPressed,
            icon: child,
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        Text(
          label,
        )
      ],
    );
  }
}

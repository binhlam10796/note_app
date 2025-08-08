import 'package:flutter/material.dart';
import '../gen/assets.gen.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_elevations.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.topRight,
      child: Container(
        width: 113,
        height: 132,
        margin: const EdgeInsets.only(top: 108, right: 16), // Position below app bar
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppElevations.filterDialog,
        ),
        child: Column(
          children: [
            _FilterOption(
              icon: Assets.svgs.textFormat.svg(),
              label: 'Name',
              isFirst: true,
              onTap: () => _handleFilterOption(context, 'Name'),
            ),
            _FilterOption(
              icon: Assets.svgs.straighten.svg(),
              label: 'Number',
              onTap: () => _handleFilterOption(context, 'Number'),
            ),
            _FilterOption(
              icon: Assets.svgs.tag.svg(),
              label: 'Type',
              isLast: true,
              onTap: () => _handleFilterOption(context, 'Type'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleFilterOption(BuildContext context, String option) {
    Navigator.of(context).pop(option);
    // Handle filter selection logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Filter by $option selected'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class _FilterOption extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool isFirst;
  final bool isLast;
  final VoidCallback onTap;

  const _FilterOption({
    Key? key,
    required this.icon,
    required this.label,
    this.isFirst = false,
    this.isLast = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.vertical(
          top: isFirst ? const Radius.circular(12) : Radius.zero,
          bottom: isLast ? const Radius.circular(12) : Radius.zero,
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: !isLast
                ? const Border(
                    bottom: BorderSide(
                      color: AppColors.border,
                      width: 1,
                    ),
                  )
                : null,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: icon,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper function to show the filter dialog positioned relative to the filter button
Future<String?> showFilterDialog(BuildContext context) {
  return showDialog<String>(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return const FilterDialog();
    },
  );
}
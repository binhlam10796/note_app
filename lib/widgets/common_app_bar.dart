import 'package:flutter/material.dart';
import '../gen/assets.gen.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_elevations.dart';
import 'filter_dialog.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onSortPressed;

  const CommonAppBar({
    Key? key,
    required this.title,
    this.onSortPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: AppElevations.appBar,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              // Title
              Expanded(
                child: Text(
                  title,
                  style: AppTypography.h2.copyWith(
                    color: AppColors.onSurface,
                  ),
                ),
              ),
              // Sort Button
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: InkWell(
                  onTap: onSortPressed ?? () => _handleSortPressed(context),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: Assets.svgs.sort.svg(
                            colorFilter: const ColorFilter.mode(
                              AppColors.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Sort',
                          style: AppTypography.labelMedium.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Filter Button
              InkWell(
                onTap: () => _handleFilterPressed(context),
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Assets.svgs.straighten.svg(
                      colorFilter: const ColorFilter.mode(
                        AppColors.onSurface,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSortPressed(BuildContext context) {
    // Show sort options
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Sort by',
                style: AppTypography.h5.copyWith(
                  color: AppColors.onSurface,
                ),
              ),
              const SizedBox(height: 16),
              _SortOption(
                title: 'Smallest number first',
                onTap: () => _handleSortOption(context, 'number_asc'),
              ),
              _SortOption(
                title: 'Highest number first',
                onTap: () => _handleSortOption(context, 'number_desc'),
              ),
              _SortOption(
                title: 'A-Z',
                onTap: () => _handleSortOption(context, 'name_asc'),
              ),
              _SortOption(
                title: 'Z-A',
                onTap: () => _handleSortOption(context, 'name_desc'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  void _handleFilterPressed(BuildContext context) {
    showFilterDialog(context);
  }

  void _handleSortOption(BuildContext context, String option) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sort by $option selected'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(108);
}

class _SortOption extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _SortOption({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.border,
              width: 1,
            ),
          ),
        ),
        child: Text(
          title,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.onSurface,
          ),
        ),
      ),
    );
  }
}
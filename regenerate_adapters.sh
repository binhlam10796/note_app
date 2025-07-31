#!/bin/bash
# Script to regenerate Hive adapters after model changes

echo "Regenerating Hive adapters..."
echo "Note: Run this script after making changes to @HiveType models"

# Delete existing generated files
echo "Cleaning up existing generated files..."
find lib -name "*.g.dart" -delete

# Regenerate adapters
echo "Running build_runner to generate new adapters..."
dart run build_runner build --delete-conflicting-outputs

echo "Code generation complete!"
echo "Remember to:"
echo "1. Test the app thoroughly"
echo "2. Update version numbers if needed"
echo "3. Run flutter clean if there are any issues"
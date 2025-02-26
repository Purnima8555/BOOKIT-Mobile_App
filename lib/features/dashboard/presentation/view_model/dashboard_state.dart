import 'package:bookit_flutter_project/features/explore/presentation/view/explore_view.dart';
import 'package:bookit_flutter_project/features/home/presentation/view/home_view.dart';
import 'package:bookit_flutter_project/features/saved/presentation/view/saved_view.dart';
import 'package:bookit_flutter_project/view/profile_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DashboardState extends Equatable {
  final int selectedIndex;
  final List<Widget> pages;

  const DashboardState({
    required this.selectedIndex,
    required this.pages,
  });

  static DashboardState initial() {
    return const DashboardState(
      selectedIndex: 0,
      pages: [
        HomeView(),
        ExploreView(),
        SavedView(),
        ProfileView(),
      ],
    );
  }

  DashboardState copyWith({
    int? selectedIndex,
    List<Widget>? pages,
  }) {
    return DashboardState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      pages: pages ?? this.pages,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, pages];
}

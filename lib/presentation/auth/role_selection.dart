import 'package:flutter/material.dart';
import 'package:pipe_x/pipe_x.dart';
import 'package:revo_schools/application/role_selection/role_selection_hub.dart';

class RoleSelectionScreen extends StatelessWidget {
  final ValueChanged<String>? onRoleSelected;
  final String? title;

  const RoleSelectionScreen({
    super.key,
    this.onRoleSelected,
    this.title,
  });

  List<List<String>> _buildRows(List<String> input) {
    if (input.isEmpty) return const [];
    final List<List<String>> rows = [];
    final bool isOdd = input.length.isOdd;

    int startIndex = 0;
    if (isOdd) {
      rows.add([input.first]);
      startIndex = 1;
    }

    for (int i = startIndex; i < input.length; i += 2) {
      final end = (i + 2 <= input.length) ? i + 2 : input.length;
      rows.add(input.sublist(i, end));
    }

    return rows;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rows = _buildRows(HubProvider.of<RoleSelectionHub>(context).roles);

    return Scaffold(
      appBar: title == null
          ? null
          : AppBar(
              title: Text(title!),
              centerTitle: true,
            ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int r = 0; r < rows.length; r++) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int c = 0; c < rows[r].length; c++) ...[
                      _RoleCircle(
                        label: rows[r][c],
                        onTap: () {
                          if (onRoleSelected != null) {
                            onRoleSelected!(rows[r][c]);
                          } else {
                            Navigator.of(context).maybePop(rows[r][c]);
                          }
                        },
                      ),
                      if (c != rows[r].length - 1) const SizedBox(width: 40),
                    ],
                  ],
                ),
                if (r != rows.length - 1) const SizedBox(height: 28),
              ],
              if (rows.isEmpty)
                Text(
                  'No roles provided',
                  style: theme.textTheme.bodyMedium,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCircle extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _RoleCircle({
    required this.label,
    required this.onTap,
  });

  String _emojiForLabel(String text) {
    final l = text.toLowerCase().trim();
    if (l == 'student' || l.contains('student')) return '🎓';
    if (l == 'teacher' || l.contains('teacher') || l.contains('tutor')) return '🧑‍🏫';
    if (l == 'principal' || l.contains('principal')) return '👑';
    if (l == 'staff' || l.contains('staff')) return '🧑‍💼';
    return '👤';
  }

  @override
  Widget build(BuildContext context) {
    final emoji = _emojiForLabel(label);
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(999),
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurple.shade400,
                  Colors.purple.shade300,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              emoji,
              style: const TextStyle(
                fontSize: 50,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 104,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

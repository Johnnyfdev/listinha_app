// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../shared/definitions/const_values.dart';
import '../../../../../shared/services/storage/realm/models/task_model.dart';

enum TaskCardStatus {
  pending(Icons.access_time, 'Pendente'),
  completed(Icons.check, 'Concluída'),
  disabled(Icons.cancel_outlined, 'Desativada');

  final IconData icon;
  final String text;

  const TaskCardStatus(
    this.icon,
    this.text,
  );
}

class TaskCardWidget extends StatelessWidget {
  final TaskBoardModel taskBoard;
  final double height;
  const TaskCardWidget({
    Key? key,
    required this.taskBoard,
    this.height = 140,
  }) : super(key: key);

  double getProgress(List<TaskModel> tasks) {
    if (tasks.isEmpty) return 0;
    final total = tasks.length;
    final done = tasks.where((task) => task.isCompleted).length;
    return done / total;
  }

  String getProgressText(List<TaskModel> tasks) {
    final total = tasks.length;
    final done = tasks.where((task) => task.isCompleted).length;
    return '$done/$total';
  }

  TaskCardStatus getStatus(TaskBoardModel taskBoardModel, double progress) {
    if (!taskBoardModel.isEnable) {
      return TaskCardStatus.disabled;
    } else if (progress < 1) {
      return TaskCardStatus.pending;
    } else {
      return TaskCardStatus.completed;
    }
  }

  Color getBackgroundColors(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.primaryContainer;
      case TaskCardStatus.completed:
        return theme.colorScheme.tertiaryContainer;
      case TaskCardStatus.disabled:
        return theme.colorScheme.errorContainer;
    }
  }

  Color getColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.primary;
      case TaskCardStatus.completed:
        return theme.colorScheme.tertiary;
      case TaskCardStatus.disabled:
        return theme.colorScheme.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final progress = getProgress(taskBoard.tasks);
    final progressText = getProgressText(taskBoard.tasks);
    final progressValue = progress * 100;
    final title = taskBoard.title;
    final status = getStatus(taskBoard, progress);
    final statusText = status.text;
    final icon = status.icon;
    final backgroundColor = getBackgroundColors(status, theme);
    final color = getColor(status, theme);

    return InkWell(
      onTap: () {
        // TODO: Navigate to taskboard page
      },
      borderRadius: BorderRadius.circular(
        ConstValues.borderRadiusNormal,
      ),
      child: Ink(
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            ConstValues.borderRadiusNormal,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(ConstValues.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    icon,
                    color: color,
                    size: ConstValues.iconSizeSmall,
                  ),
                  Text(
                    statusText,
                    textAlign: TextAlign.right,
                    style: textTheme.bodySmall!.copyWith(
                      color: color,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.titleLarge!.copyWith(
                      fontWeight: ConstValues.fontWeightBold,
                    ),
                  ),
                  if (taskBoard.tasks.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: LinearProgressIndicator(
                                color: color,
                                value: progress,
                                backgroundColor:
                                    theme.colorScheme.onInverseSurface,
                              ),
                            ),
                            const SizedBox(width: ConstValues.spacerMedium),
                            Expanded(
                              child: Text(
                                '${progressValue.toStringAsFixed(0)}%',
                              ),
                            )
                          ],
                        ),
                        Text(
                          progressText,
                          style: textTheme.labelSmall!.copyWith(
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
part 'dash_metrics_entity.freezed.dart';

@freezed
class DashMetricsEntity with _$DashMetricsEntity {
  DashMetricsEntity({
    required this.value,
    required this.title,
    required this.description,
    this.url,
  });

  @override
  final int value;
  @override
  final String title;
  @override
  final String description;
  @override
  final String? url;
}

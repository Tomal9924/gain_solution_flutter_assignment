class TagOption {
  final String label;
  final String value;

  TagOption({required this.label, required this.value});

  factory TagOption.fromJson(Map<String, dynamic> json) {
    return TagOption(
      label: json['label'],
      value: json['value'],
    );
  }
}
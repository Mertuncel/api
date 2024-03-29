class Weather {
  String? date;
  String? day;
  String? icon;
  String? description;
  String? status;
  String? degree;
  String? min;
  String? max;
  String? night;
  String? humidity;

  Weather(
      {this.date,
      this.day,
      this.icon,
      this.description,
      this.status,
      this.degree,
      this.min,
      this.max,
      this.night,
      this.humidity});

  Weather.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'];
    icon = json['icon'];
    description = json['description'];
    status = json['status'];
    degree = json['degree'];
    min = json['min'];
    max = json['max'];
    night = json['night'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['day'] = day;
    data['icon'] = icon;
    data['description'] = description;
    data['status'] = status;
    data['degree'] = degree;
    data['min'] = min;
    data['max'] = max;
    data['night'] = night;
    data['humidity'] = humidity;
    return data;
  }

  @override
  String toString() {
    return 'Weather(date: $date, day: $day, icon: $icon, description: $description, status: $status, degree: $degree, min: $min, max: $max, night: $night, humidity: $humidity)';
  }
}

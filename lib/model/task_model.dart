class TaskModel {
  String? tasktitle;
  bool? status;
  String? id;

  TaskModel({this.tasktitle, this.status, this.id});

  Map<String, dynamic> toJson() {
    return {
      'tasktitle': tasktitle,
      'status': status,
      'id': id,
    };
  }

  TaskModel.fromJson(Map<String, dynamic> json)
      : tasktitle = json['tasktitle'],
        status = json['status'],
        id = json['id'];
}

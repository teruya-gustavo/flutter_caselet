class Ticket {
  final int id;
  final int alertId;
  final String title;
  final String description;
  final String? picture;

  Ticket(this.id, this.alertId, this.title, this.description, {this.picture});

  Ticket.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        alertId = json["alert_id"],
        title = json["title"],
        picture = json["picture"],
        description = json["description"];
}

class NewOrderModel {
  double ? fromLng;
  double ? fromLat;
  double ? toLng;
  double ? toLat;
  String ? paymentType;
  String ? notes;
  String ? status;
  String ? statusPaid;
  String ? driverId;
  String ? customerId;

  NewOrderModel({
    this.fromLng,
    this.fromLat,
    this.toLng,
    this.toLat,
    this.notes,
    this.paymentType,
    this.status,
    this.statusPaid,
    this.driverId,
    this.customerId
  });


  NewOrderModel.fromJson(Map<String, dynamic> json) {
    fromLng = json['from_lng'];
    fromLat = json['from_lat'];
    toLng = json['to_lng'];
    toLat = json['to_lat'];
    paymentType = json['payment_type'];
    notes = json['notes'];
    status = json['status'];
    statusPaid = json['status_paid'];
    driverId = json['driver_id'];
    customerId = json['customer_id'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from_lng'] = fromLng;
    data['from_lat'] = fromLat;
    data['to_lng'] = toLng;
    data['to_lat'] = toLat;
    data['payment_type'] = paymentType;
    data['notes'] = notes;
    data['status'] = status;
    data['status_paid'] = statusPaid;
    data['driver_id'] = driverId;
    data['customer_id'] = customerId;
    return data;
  }





}


/*   'from_lng' => 'required|numeric',
            'from_lat ' => 'required|numeric',
            'to_lng' => 'required|numeric',
            'to_lat' => 'required|numeric',
            'payment_type' => 'nullable',
            'notes' => 'nullable',
            'status' => 'in:pending,in_progress,completed,cancelled',
            'status_paid' => 'in:paid,unpaid',
            'driver_id' => 'nullable|exists:users,id',
            'customer_id' => 'required|exists:users,id',*/

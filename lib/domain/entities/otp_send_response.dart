class OtpSentResponse {
    final int? data;
    final bool? status;
    final String? message;

    OtpSentResponse({
        this.data,
        this.status,
        this.message,
    });

    OtpSentResponse copyWith({
        int? data,
        bool? status,
        String? message,
    }) => 
        OtpSentResponse(
            data: data ?? this.data,
            status: status ?? this.status,
            message: message ?? this.message,
        );

    factory OtpSentResponse.fromJson(Map<String, dynamic> json) => OtpSentResponse(
        data: json["data"],
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data,
        "status": status,
        "message": message,
    };
}

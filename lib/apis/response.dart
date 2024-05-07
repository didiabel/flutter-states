class Response {
  int statusCode;
  final dynamic data;

  Response(this.statusCode, this.data);

  Map<String, dynamic> getDataObject() {
    return data as Map<String, dynamic>;
  }

  List<Map<String, dynamic>> getDataList() {
    final List<Map<String, dynamic>> newList = [];

    for (final i in data) {
      if (i is Map<String, dynamic>) {
        newList.add(i);
      }
    }

    return newList;
  }
}

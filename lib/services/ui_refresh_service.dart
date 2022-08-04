Future<void> refreshPage(setState) {
  return Future.delayed(Duration(seconds: 3), () {
    setState(() {});
  });
}

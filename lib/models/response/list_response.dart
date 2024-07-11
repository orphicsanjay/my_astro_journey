class ListResponse {
  int statusCode;
  dynamic data;
  String message;

  ListResponse({
    required this.statusCode,
    this.data,
    required this.message,
  });
}

  // "next": null,
  // "previous": null,
  // "total_pages": 1,
  // "current_page": 1,
  // "count": 1,
  // "data": [
  //   {
  //     "title": "Are you looking for Aakarshan Puja?",
  //     "starting_date": "2024-07-11T07:37:37Z",
  //     "ending_date": "2024-07-31",
  //     "image": "https://dev.myastrojourney.com/media/banner/aakarshan_puja_pGHwBAW.jpg",
  //     "redirect_url": "BannerDetailPage",
  //     "order": 0
  //   }
  // ]
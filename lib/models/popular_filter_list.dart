class PopularFilterListData {
  String titleText;
  bool isSelected;

  PopularFilterListData({
    this.titleText = '',
    this.isSelected = false,
  });

  static List<PopularFilterListData> popularFilterList =
      <PopularFilterListData>[
    PopularFilterListData(
      titleText: 'Free wifi',
      isSelected: false,
    ),
    PopularFilterListData(
      titleText: '2nd Floor',
      isSelected: false,
    ),
    PopularFilterListData(
      titleText: 'Pool',
      isSelected: true,
    ),
    PopularFilterListData(
      titleText: 'Pet Friendly',
      isSelected: false,
    ),
    PopularFilterListData(
      titleText: 'Free Parking',
      isSelected: false,
    ),
  ];

  static List<PopularFilterListData> accommodationList = [
    PopularFilterListData(
      titleText: 'All',
      isSelected: false,
    ),
    PopularFilterListData(
      titleText: 'Apartment',
      isSelected: false,
    ),
    PopularFilterListData(
      titleText: 'Home',
      isSelected: true,
    ),
    PopularFilterListData(
      titleText: 'Villa',
      isSelected: false,
    ),
    PopularFilterListData(
      titleText: 'Hotel',
      isSelected: false,
    ),
    PopularFilterListData(
      titleText: 'Resort',
      isSelected: false,
    ),
    PopularFilterListData(
      titleText: 'Piot',
      isSelected: false,
    ),
  ];
}

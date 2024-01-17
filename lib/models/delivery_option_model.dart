class DeliveryOptions {
  final String title, subTitle;
  final bool isRadioSelected;
  DeliveryOptions(
      {required this.title,
      required this.subTitle,
      required this.isRadioSelected});

  static List<DeliveryOptions> deliveryOptionList = [
    DeliveryOptions(
        title: 'Regular Delivery',
        subTitle:
        'Pick a particular date from the calender and ...',
        isRadioSelected: false),
    DeliveryOptions(
        title: 'Fastest Delivery',
        subTitle:
            'Place your order before 6pm and your items will be delivered the next day',
        isRadioSelected: false),
  ];
}

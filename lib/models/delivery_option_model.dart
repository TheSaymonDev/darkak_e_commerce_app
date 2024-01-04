class DeliveryOptions {
  final String title, subTitle;
  final bool isRadioSelected;
  DeliveryOptions(
      {required this.title,
      required this.subTitle,
      required this.isRadioSelected});

  static List<DeliveryOptions> deliveryOptionList = [
    DeliveryOptions(
        title: 'Free Delivery',
        subTitle: 'Order will be delivered between 3 - 5 business days',
        isRadioSelected: false),
    DeliveryOptions(
        title: 'Fastest Delivery',
        subTitle:
            'Place your order before 6pm and your items will be delivered the next day',
        isRadioSelected: false),
    DeliveryOptions(
        title: 'Home Delivery Available',
        subTitle:
            'Pick a particular date from the calendar and order will be delivered on selected date',
        isRadioSelected: false),
    DeliveryOptions(
        title: 'Cash on Delivery Available',
        subTitle:
            'Pick a particular date from the calendar and order will be delivered on selected date',
        isRadioSelected: false),
  ];
}

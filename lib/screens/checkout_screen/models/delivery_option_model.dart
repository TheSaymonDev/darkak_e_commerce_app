class DeliveryOptionModel {
  final String title, subTitle, value;
  final bool isRadioSelected;
  DeliveryOptionModel(
      {required this.title,
      required this.subTitle,
        required this.value,
      required this.isRadioSelected});

  static List<DeliveryOptionModel> deliveryOptionList = [
    DeliveryOptionModel(
        title: 'Regular Delivery',
        subTitle:
        'Pick a particular date from the calender and ...',
        value: 'REGULAR',
        isRadioSelected: false),
    // DeliveryOptions(
    //     title: 'Fastest Delivery',
    //     subTitle:
    //         'Place your order before 6pm and your items will be delivered the next day',
    //     value: 'REGULAR',
    //     isRadioSelected: false),
  ];
}

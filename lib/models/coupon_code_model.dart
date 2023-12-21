class CouponCodeModel{
  String couponCode, discount;
  CouponCodeModel({required this.couponCode, required this.discount});
  static List<CouponCodeModel> couponCodeList = [
    CouponCodeModel(couponCode: 'WELCOME200', discount: '20'),
    CouponCodeModel(couponCode: 'WELCOME300', discount: '10'),
    CouponCodeModel(couponCode: 'WELCOME400', discount: '30'),
    CouponCodeModel(couponCode: 'WELCOME500', discount: '40'),
  ];
}
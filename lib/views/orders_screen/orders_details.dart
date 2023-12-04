import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/orders_screen/components/order_place_details.dart';
import 'package:emart_app/views/orders_screen/components/order_status.dart';
import 'package:intl/intl.dart' as intl;

class OrdersDetails extends StatelessWidget {
  final dynamic data;
  const OrdersDetails({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Order Details"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                children: [
                  orderStatus(
                      color: redColor,
                      icon: Icons.done,
                      title: "Placed",
                      showDone: data['order_placed']),
                  orderStatus(
                      color: Colors.blue,
                      icon: Icons.thumb_up,
                      title: "Confirmed",
                      showDone: data['order_confirmed']),
                  orderStatus(
                      color: Colors.yellow,
                      icon: Icons.car_crash,
                      title: "On delivery",
                      showDone: data['order_on_deliverey']),
                  orderStatus(
                      color: Colors.purple,
                      icon: Icons.done_all_rounded,
                      title: "Delivered",
                      showDone: data['order_delivered']),
                  const Divider(),
                  10.heightBox,
                  Column(
                    children: [
                      orderPlaceDetails(
                        d1: data['order_code'],
                        d2: data['shipping_method'],
                        title1: "Order Code",
                        title2: "Shipping Method",
                      ),
                      orderPlaceDetails(
                        d1: intl.DateFormat()
                            .add_yMd()
                            .format(data['order_data'].toDate()),
                        d2: data['payment_method'],
                        title1: "Order Date",
                        title2: "Payment Method",
                      ),
                      orderPlaceDetails(
                        d1: "Unpaid",
                        d2: "Order placed",
                        title1: "Payment Status",
                        title2: "Delivery Status",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Shipping Adress"
                                    .text
                                    .fontFamily(semibold)
                                    .make(),
                                "${data['order_by_name']}".text.make(),
                                "${data['order_by_email']}".text.make(),
                                "${data['order_by_address']}".text.make(),
                                "${data['order_by_city']}".text.make(),
                                "${data['order_by_state']}".text.make(),
                                "${data['order_by_phone']}".text.make(),
                                "${data['order_by_postalcode']}".text.make()
                              ],
                            ),
                            SizedBox(
                              width: 130,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "Total Ammount"
                                      .text
                                      .fontFamily(semibold)
                                      .make(),
                                  "${data['total_ammount']}"
                                      .text
                                      .color(redColor)
                                      .fontFamily(bold)
                                      .make()
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).box.outerShadowMd.white.make(),
                  const Divider(),
                  10.heightBox,
                  "Order Product"
                      .text
                      .size(16)
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .makeCentered(),
                  10.heightBox,
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(data['orders'].length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          orderPlaceDetails(
                            title1: data['orders'][index]['title'],
                            title2: data['orders'][index]['tprice'].numCurrency,
                            d1: "${data['orders'][index]['qty']}x ",
                            d2: "Refundable",
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              width: 30,
                              height: 20,
                              color: Color(data['orders'][index]['color']),
                            ),
                          ),
                          const Divider(),
                        ],
                      );
                    }).toList(),
                  )
                      .box
                      .outerShadowMd
                      .white
                      .margin(const EdgeInsets.only(bottom: 4))
                      .make(),
                  20.heightBox,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lavie/modules/Home_Layout/Cubit/homeCubit.dart';
import 'package:lavie/modules/Home_Layout/Cubit/homeState.dart';
import '../../models/product_model/Product.dart';
import '../../modules/Home_Layout/plog/blogDetels.dart';
import '../styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget pageViewItem(titlepageview model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          child: Image(
        image: AssetImage(model.image),
      )),
      SizedBox(
        height: 15,
      ),
      Text(
        model.title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 10,
      ),
      Text(model.desc),
    ],
  );
}

class titlepageview {
  late final String image;
  late final String title;
  late final String desc;
  titlepageview({required this.image, required this.title, required this.desc});
}

Future NavigatFinsh(context, widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget),
      result: (rout) {
        return false;
      },
    );

Widget DefoultformFild({
  required TextEditingController controller,
  required TextInputType type,
  required bool isPassword,
  onsubmit,
  onChange,
  onTap,
  required validate,
  String? label,
  IconData? prefix,
  IconData? suffix,
  suffixfun,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onsubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      maxLines: 1,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(onPressed: suffixfun, icon: Icon(suffix)),
      ),
    );
Widget defultButton({
  context,
  required onpressed,
  required String text,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: DefeultColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextButton(
        onPressed: onpressed,
        child: Text(text,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white,
                )),
      ),
    );
Widget defultTextButton({
  context,
  required onpressed,
  required String text,
}) =>
    TextButton(
      onPressed: onpressed,
      child: Text(
        text,
      ),
    );
void navigatTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigatandFinish(context, widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void showtoast({required String text, required toastStates state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: toastColor(state: state),
        textColor: Colors.white,
        fontSize: 16.0);

enum toastStates { ERROR, WARRING, SUCESS }

Color? toastColor({toastStates? state}) {
  HexColor? color;
  switch (state) {
    case toastStates.ERROR:
      color = HexColor("EFAEAEA5");
      break;
    case toastStates.SUCESS:
      color = DefeultColor;
      break;
    case toastStates.WARRING:
      color = HexColor("F8C188FF");
      break;
  }
  return color;
}

Widget SearchDefult({
  required context,
  required searchController,
  required Function onChange(value),
  ontap,
  required bool isClickable,
}) =>
    Container(
      //height: 80,
      decoration: BoxDecoration(
        color: DefeultGrey,
        borderRadius: BorderRadius.circular(14),
      ),

      child: TextFormField(
        controller: searchController,
        maxLines: 1,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return "Search can't be empty";
          }
          return null;
        },
        onTap: ontap,
        onChanged: onChange,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.0, color: DefeultGrey),
              borderRadius: BorderRadius.circular(14)),
          enabled: isClickable,
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.search,
                color: Colors.black38,
              ),
              Text(
                "Search",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: 18, color: Colors.black38),
              ),
            ],
          ),
          prefix: Icon(Icons.search),
        ),
      ),
    );

Widget BottumDefult({
  onPresse,
  text,
}) =>
    Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onPresse,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );

Widget plantItem(
  context,
  Data Item,
) {
  return Container(
    //margin: EdgeInsets.all(4),
    height: 700,
    padding: EdgeInsets.symmetric(horizontal: 40),
    alignment: Alignment.bottomCenter,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
    ),
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Card(
          elevation: 6,
          margin: EdgeInsets.only(top: 40),
          shadowColor: Colors.black87,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                    left: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Item.amount = HomeCubit.get(context)
                              .IncreAmount(Item.amount ?? 1);
                          print('add ${Item.amount}');
                        },
                        child: Container(
                          height: 16,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            color: Colors.black12,
                          ),
                          child: Icon(
                            Icons.add,
                            size: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      BlocBuilder<HomeCubit, HomeState>(
                        buildWhen: (previouse, state) {
                          if (state == ChangeAmountState()) {
                            return true;
                          } else {
                            return false;
                          }
                        },
                        builder: (context, state) => Text(
                          "${Item.amount}",
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () {
                          Item.amount = HomeCubit.get(context)
                              .DecreAmount(Item.amount ?? 1);
                          print("sub ${Item.amount}");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            color: Colors.black12,
                          ),
                          height: 16,
                          width: 20,
                          child: Icon(
                            Icons.remove,
                            size: 10,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.all(4),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${Item.name}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                      ),
                      Text(
                        "${Item.price} EGP",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 8,
                              color: Colors.black54,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    height: 16,
                    width: double.infinity,
                    child: BottumDefult(
                        onPresse: () async {
                          HomeCubit.get(context)
                              .addDataFB(context, Item, Item.amount);
                        },
                        text: "Add To Cart")),
              ),
              SizedBox(
                height: 4,
              )
            ],
          ),
        ),
        Container(
          // height: 420,
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 10, left: 8),
          // color: Colors.lightBlueAccent,
          padding: EdgeInsets.only(
            bottom: 120,
            top: 4,
            left: 4,
            //  right: 40
          ),
          child: Image.network(
            "https://lavie.orangedigitalcenteregypt.com${Item.imageUrl}",

            width: 80,
            height: 240,
            // loadingBuilder:(context, child, loadingProgress) =>Image.asset('assets/images/plant.png',color: Colors.black12,)
          ),
        )
      ],
    ),
  );
}

Widget defeultGridView(length, Items) => Items != null
    ? GridView.builder(
        itemCount: length,
        itemBuilder: (context, index) {

          return plantItem(context, Items[index]);
        },
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      )
    : CircularProgressIndicator();

Widget notifiItem() => Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white10,
                  child: Image.asset(
                    'assets/images/avtProfile.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "Dennis Nedry commented on Isla Nublar SOC2 compliance report",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 140,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: HexColor('#DDDEE1'),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                      " leaves are an integral part of the stem system.\n "
                      "They are attached by a continuous vascular system to \nthe rest of the plant so that free exchange of nutrients."),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0, right: 20.0, bottom: 4),
            child: Text("${DateTime.now()})"),
          ),
          Divider(
            color: Colors.grey,
            height: 4,
          )
        ],
      ),
    );
Widget filterItem(context, {String? title, item}) {
  return InkWell(
    onTap: () {
      HomeCubit.get(context).onFilter(title.toString());
    },
    child: Container(
      height: 24,
      width: 48,
      decoration: BoxDecoration(
        color: HomeCubit.get(context).currentFilter == title
            ? Colors.white
            : DefeultGrey,
        borderRadius: BorderRadius.circular(6),
        border: HomeCubit.get(context).currentFilter == title
            ? Border.all(color: DefeultColor, width: 1)
            : null,
      ),
      child: Center(
          child: Text(
        "$title",
        style: TextStyle(
          fontSize: 16,
          color: HomeCubit.get(context).currentFilter == title
              ? DefeultColor
              : Colors.black38,
        ),
      )),
    ),
  );
}

Widget RadioDefault({required String? answerText, value, group, onchange}) =>
    Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: DefeultGrey,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: DefeultColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$answerText"),
          Radio(
            activeColor: DefeultColor,
            value: value,
            groupValue: group,
            onChanged: onchange,
          ),
        ],
      ),
    );
Widget EmptyScreen({
  required String? title,
  required String? subtitle,
}) =>
    Container(
      margin: EdgeInsets.symmetric(vertical: 100, horizontal: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Image.asset(
                'assets/images/emptycart.png',
              )),
          SizedBox(
            height: 30,
          ),
          Text(
            '$title',
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 25, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Text(
              '$subtitle',
              style: TextStyle(fontSize: 17, color: Colors.grey.shade600),
            ),
          )
        ],
      ),
    );
Widget CartItem(context, item) => Card(
      shadowColor: DefeultGrey,
//shadowColor: Color.fromRGBO(90, 89, 89, 0.1),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      margin: EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
//  Image.network("https://lavie.orangedigitalcenteregypt.com${Item.imageUrl}"),
            Expanded(
                child: Image.network(
              "https://lavie.orangedigitalcenteregypt.com${item['imageUrl']}",
              width: 120,
              height: 120,
            )),
            SizedBox(
              width: 12,
            ),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${item['name']}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "${item['price']} EGP",
                      style: TextStyle(color: DefeultColor, fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          color: DefeultGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    item['amount'] = HomeCubit.get(context)
                                        .IncreAmount(item['amount'] ?? 1);
                                  },
                                  icon: Icon(Icons.add,color: DefeultColor,)),
                              BlocBuilder<HomeCubit, HomeState>(
                                buildWhen: (previouse, state) {
                                  if (state == ChangeAmountState()) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                },
                                builder: (context, state) => Text(
                                  "${item['amount']}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    item['amount'] = HomeCubit.get(context)
                                        .DecreAmount(item['amount'] ?? 1);
                                    if (item['amount'] <= 0) {
                                      HomeCubit.get(context)
                                          .delete(context, item);
                                    }
                                  },
                                  icon: Icon(Icons.remove,color: DefeultColor,)),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            HomeCubit.get(context).delete(context, item);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: DefeultColor,
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
Widget BlogstItem(context, item) => InkWell(
  onTap: (){
    navigatTo(context, BlogDetals(item: item));
  },
  child:   Card(

        shadowColor: DefeultGrey,

        elevation: 10,

        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(14),

        ),

        margin: EdgeInsets.all(12),

        child: Padding(

          padding: const EdgeInsets.all(8.0),

          child: Row(

            children: [

  //  Image.network("https://lavie.orangedigitalcenteregypt.com${Item.imageUrl}"),

              Expanded(

                child: item.imageUrl == null

                    ? Image.asset(

                        'assets/images/plant.png',

                        color: Colors.black12,

                      )

                    : Image.network(

                        "https://lavie.orangedigitalcenteregypt.com${item.imageUrl}",

                        width: 120,

                        height: 120,



                        errorBuilder:

            (BuildContext context, Object exception, StackTrace? stackTrace) {



      return  Image.asset(

        'assets/images/plant.png',

        width: 120,

        height: 120,

        color: Colors.black12,

      );

  },

                        loadingBuilder: (BuildContext context, Widget child,

                            ImageChunkEvent? loadingProgress) {

                          if (loadingProgress == null) {

                            return child;

                          }

                          return Center(

                            child: Container(

                              width: 120,

                              height: 120,

                              child: CircularProgressIndicator(

                                value: loadingProgress.expectedTotalBytes != null

                                    ? loadingProgress.cumulativeBytesLoaded /

                                        loadingProgress.expectedTotalBytes!

                                    : null,

                              ),

                            ),

                          );

                        },

                      ),

              ),

              SizedBox(

                width: 12,

              ),

              Expanded(

                  flex: 2,

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [

                      Text(

                        " 2 day ago",

                        style: TextStyle(color: DefeultColor, fontSize: 18),

                      ),

                      Text(

                        "${item.name}",

                        style: TextStyle(

                            color: Colors.black,

                            fontWeight: FontWeight.bold,

                            fontSize: 18),

                      ),

                      Text(

                        " 5 tips to treat plants",

                        style: TextStyle(color: Colors.black, fontSize: 18),

                      ),

                      Text(

                        "${item.description}",

                        style: TextStyle(color: DefeultGrey, fontSize: 12),

                      ),

                    ],

                  )),

            ],

          ),

        ),

      ),
);

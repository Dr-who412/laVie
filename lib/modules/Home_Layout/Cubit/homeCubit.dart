import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/models/login_models/loginModel.dart';
import 'package:lavie/modules/Home_Layout/plog/blog.dart';
import 'package:lavie/modules/login_screen/cubit/cubit.dart';
import '../../../models/Blod_Model/blogs.dart';
import '../../../models/product_model/Product.dart';
import '../../../models/product_model/filterModel.dart';
import '../Shop/shop.dart';
import '../notification/notification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../profile/posts.dart';
import '../profile/profile.dart';
import '../qr/qr.dart';
import '../../../shared/network/remote/Dio_Helper.dart';
import 'homeState.dart';
import '../../../shared/network/endPoint.dart';
import '../../../shared/componant/constance.dart';




class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(InitHomeState());
  static HomeCubit get(context)=>BlocProvider.of(context);
  List <Widget>homeScreen=[
    Blog(),
    QR(),
    Shop(),
    NotificationScreen(),
    Profile(),
  ];
 int currentBotNavIndex=2;
 ChangeBotNav(index){
 currentBotNavIndex=index;
 emit(ChangeBottomNavState());
 }
 Product? productData;
  void getProduct() async{
    emit(LoadingDataState());
print("get dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
print(accessToken);
    await DioHelper.getdata(url: PRODUCT,token: accessToken).then((value) {
    productData=Product.fromJson(value.data);
      emit(SuccessGetDataState());
      print(value);
    }).catchError((error) {
      print('ERROR');
      print(error.toString());
      emit(ErrorGetDataState(error));
    });
  }
  int? IncreAmount(int amount){
    amount++;
    emit(ChangeAmountState());
    return amount;
  }
  int DecreAmount(int amount){
    amount--;
    emit(ChangeAmountState());
    return amount;
  }

  List cartData = [];
  Future getDataFB(context) async {
    cartData = [];
    CollectionReference archiveRef =
    FirebaseFirestore.instance.collection(userId);
    await archiveRef
        //.where("userId", isEqualTo: userId)
        .get()
        .then((value) => value.docs.
    forEach((element) {
      print(element);
      cartData.add(element['data']);
      print('get data done');
      print(cartData);
      emit(SuccessgetfirebaseState());
    }))
        .catchError((error) {

      print("error ya3m$error");
      emit(ErrorfirebaseState(error.toString()));
    });
  }

  addDataFB(context,item,amount){
    emit(LoadingfirebaseState());

    print(userId);
    CollectionReference archiveRef =
    FirebaseFirestore.instance.collection(userId);
    archiveRef.doc(item.productId).set({
     'data': {
        'productId':item.productId,
        'name' :item.name,
    'imageUrl' : item.imageUrl,
    'price' :item.price,
    'available' :item.available,
     'amount':amount,
      }

    }).then((value) {
      print("added");

      // var newItem=
      //   {'productId':item.productId,
      //     'name' :item.name,
      //     'imageUrl' : item.imageUrl,
      //     'price' :item.price,
      //     'available' :item.available,
      //     'amount':amount,
      //   };
      // cartData.add(newItem);

      emit(SuccesspushfirebaseState());
    }).catchError((error) {
      print(error);
      emit(ErrorfirebaseState(error.toString()));
    });
  }

  delete(context,item) {
    emit(LoadingfirebaseState());
    CollectionReference archiveRef =
    FirebaseFirestore.instance.collection('laVie');
    archiveRef.doc(userId).delete().then((value) {
      cartData.remove(item);
      print("deleted");
      emit(SuccessdeletefirebaseState());
    }).catchError((error) {
      print("error");
      print(error.toString());
      emit(ErrorfirebaseState(error));
    });
  }

  Blogs? blogsData;
  void getBlogs() async{
    emit(LoadingDataState());
    print("get blogsa");
    print(accessToken);
    await DioHelper.getdata(url: BLOGS,token: accessToken).then((value) {
      blogsData=Blogs.fromJson(value.data);
      emit(SuccessGetDataState());
      print(value);
    }).catchError((error) {
      print('ERROR');
      print(error.toString());
      emit(ErrorGetDataState(error));
    });
  }
  LoginModel? myProfile;
  void getProfile() async{
    emit(LoadingDataState());
    print("get profile");
    print(accessToken);
    await DioHelper.getdata(url: USERPROFILE,token: accessToken).then((value) {
      blogsData=Blogs.fromJson(value.data);
      emit(SuccessGetDataState());
      print(value);
    }).catchError((error) {
      print('ERROR');
      print(error.toString());
      emit(ErrorGetDataState(error));
    });
  }
  Product? filterData;
  FilterModel? filters;
  String? currentFilter='All';
  onFilter( filter){
    currentFilter=filter;
    // filterData=productData;
    // switch(filter){
    //   case 'all':return null;
    //   case 'plants':productData?.data=filterData?.data.where((element) => element.d.plant!=null) ;
    //   break;
    //   case 'seeds':productData?.data=filterData?.data?.where((element) => element.seed!=null) ;
    //   break;
    //   case 'tools':productData?.data=filterData?.data?.where((element) => element.tool!=null) ;
    //
    // }
    emit(ChangeFilterState());
    //getdataFilterd

  }
  void getFilter() async{
    emit(LoadingDataState());
    print("get filters");
    print(accessToken);
    await DioHelper.getdata(url: FILTER,token: accessToken).then((value) {
      filters=FilterModel.fromJson(value.data);
      emit(SuccessGetDataState());
      print(value);
    }).catchError((error) {
      print('ERROR');
      print(error.toString());
      emit(ErrorGetDataState(error));
    });
  }

}
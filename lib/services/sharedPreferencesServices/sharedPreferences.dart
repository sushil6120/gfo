import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesViewModel with ChangeNotifier{

  saveToken(String? token)async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    sp.setString('token', token!);
  }
  saveSellerToken(String? token)async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    sp.setString('Sellertoken', token!);
  }
  saveConsultantToken(String? token)async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    sp.setString('Consultanttoken', token!);
  }
  saveUserId(String? token)async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    sp.setString('userId', token!);
  }

  Future<String?> getToken()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    return token;
  }
  Future<String?> getUserId()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    final String? token = sp.getString('userId');
    return token;
  }
  Future<String?> getSellerToken()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    final String? token = sp.getString('Sellertoken');
    return token;
  }
  Future<String?> getConsultantToken()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    final String? token = sp.getString('Consultanttoken');
    return token;
  }

  saveSignUpToken(String? token)async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    sp.setString('signUpToken', token!);
  }
  saveSellerSignUpToken(String? token)async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    sp.setString('signUpSellerToken', token!);
  }
  saveConsultantSignUpToken(String? token)async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    sp.setString('signUpConsultantToken', token!);
  }

  Future<String?> getSignUpToken()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    final String? token = sp.getString('signUpToken');
    return token;
  }
  Future<String?> getSellerSignUpToken()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    final String? token = sp.getString('signUpSellerToken');
    return token;
  }
  Future<String?> getConsultantSignUpToken()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    final String? token = sp.getString('signUpConsultantToken');
    return token;
  }

  saveIsInstalled(bool? isInstalled)async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    sp.setBool('isInstalled', isInstalled!);
  }

  Future<bool?> getIsInstalled()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    final bool? isInstalled = sp.getBool('isInstalled');
    return isInstalled;
  }

  saveID(String? id)async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    sp.setString('id', id!);
  }

  Future<String?> getID()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    final String? id = sp.getString('id');
    return id;
  }

  saveUsername(String? username)async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    sp.setString('username', username!);
  }

  saveUserDetails(String? username, String? firstname, String? lastname, String? bio, String? image, String? email)async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    sp.setString('username', username!);
    sp.setString('firstname', firstname!);
    sp.setString('lastname', lastname!);
    sp.setString('bio', bio!);
    sp.setString('image', image!);
    sp.setString("email", email!);
  }

  saveEnterDetails(String? username, String? firstname, String? lastname)async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    sp.setString('username', username!);
    sp.setString('firstname', firstname!);
    sp.setString('lastname', lastname!);
  }

  saveImage(String? image)async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    sp.setString('image', image!);
  }

  saveBio(String? bio)async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    sp.setString('bio', bio!);
  }

  saveEmail(String? email)async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    sp.setString('email', email!);
  }

  Future<String?> getUsername()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    final String? username = sp.getString('username');
    return username;
  }

  Future<String?> getFirstname()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    final String? firstname = sp.getString('firstname');
    return firstname;
  }

  Future<String?> getLastname()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    final String? lastname = sp.getString('lastname');
    return lastname;
  }

  Future<String?> getBio()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    final String? bio = sp.getString('bio');
    return bio;
  }

  Future<String?> getEmail()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    final String? bio = sp.getString('email');
    return bio;
  }

  Future<String?> getImage()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    final String? image = sp.getString('image');
    return image;
  }

  saveS3Bucket(String? bucketName, String? poolId, String? region, String? path )async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    sp.setString('bucketName', bucketName!);
    sp.setString('poolId', poolId!);
    sp.setString('region', region!);
    sp.setString('path', path!);
  }

 


  Future<bool> remove()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    return sp.clear();
  }

  Future<bool> removeToken()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    return sp.remove("token");
  }
  Future<bool> removeConsultantToken()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    return sp.remove("Sellertoken");
  }
  Future<bool> removeSellerToken()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    return sp.remove("Consultanttoken");
  }

  Future<bool> removeSignUpToken()async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    return sp.remove("signUpToken");
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import '../../../auth/component/custome_textFeild.dart';
import '../../../customer/views/components/costome_appbar.dart';
import '../../providers/admin_provider.dart';

class AddNewCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: CustomeAppBar(),
        body: Consumer<AdminProvider>(builder: (context, provider, w) {
          return SingleChildScrollView(
            child: Container(
              height: 1000.h,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                 key: provider.categoryFormKey,
                child: Column(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                      onTap: () {
                        provider.pickImageForCategory();
                      },
                      child: Stack(children: [
                        Container(
                          height: 130.h,
                          width: 130.w,
                          color: Colors.grey,
                          child: provider.imageFile == null
                              ? const Center(
                                  child: Icon(Icons.camera),
                                )
                              : Image.file(
                                  provider.imageFile!,
                                  fit: BoxFit.cover,
                                ),
                        ),
  
     Positioned(
      //padding: EdgeInsets.only(top: 5, left:15),
      right: -5,
      bottom: -5,
      child: CircleAvatar(
        backgroundColor: Colors.black54,
        child: IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ), // Icon
            onPressed: () {
              provider.pickImageForCategory();
            }), // IconButton
      ), // CircleAvatar
    ),
  

                      ])),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextfield(
                    controller: provider.catNameArController,
                    label: 'Category Arabic name',
                    validation: provider.requiredValidation,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                    controller: provider.catNameEnController,
                    label: 'Category English name',
                    validation: provider.requiredValidation,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(children: [
                    Expanded(child: SizedBox()),
                    Container(
                      width: 180.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(41),
                        color: Color.fromARGB(255, 249, 250, 244),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 228, 234, 224),
                            blurRadius: 15.0, // soften the shadow
                          )
                        ],
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(41),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xffd56561)
                                // Color.fromARGB(
                                //  255, 253, 194, 42), // Background color
                                ),
                            onPressed: () {
                              provider.addNewCategory();
                            },
                            child: Text(
                              'Add New Category',
                              style: TextStyle(
                                fontSize: 8,
                                color: Color.fromARGB(255, 254, 253, 253),
                              ),
                            ),
                          )),
                    ),
                  ]),
                  Divider(),
                  Expanded(
                    child: Container(
                        height: 400.h,

                        child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 5,
                              crossAxisCount: 2,
                            ),
                            itemCount: provider.allCategories!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                // color: Colors.amber,
                                // child: Center(child: Text('$index')),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(13)),
                                          child: SizedBox(
                                              //width: double.infinity,
                                                height: 160.h,
                                              child: Image.network(
                                            provider.allCategories![index]!
                                                .imageUrl,
                                            //'https://iconstyle.ae/wp-content/uploads/2022/09/2022_08_20_14_09_IMG_0144.jpg',
                                            fit: BoxFit.cover,
                                          )),
                                        ),
                                        Positioned(
                                            right: 10,
                                            top: 5,
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor: Colors.white,
                                                  child: IconButton(
                                                      onPressed: () {
                                                        Provider.of<AdminProvider>(
                                                                context,
                                                                listen: false)
                                                            .deleteCategory(
                                                                provider.allCategories![
                                                                    index]!);
                                                      },
                                                      icon: Icon(Icons.delete)),
                                                ),
                                                /*  SizedBox(
                                              height: 5,
                                            ),*/
                                                CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor: Colors.white,
                                                  child: IconButton(
                                                      onPressed: () {
                                                        Provider.of<AdminProvider>(
                                                                context,
                                                                listen: false)
                                                            .goToEditCategoryPage(
                                                                provider.allCategories![
                                                                    index]!);
                                                      },
                                                      icon: Icon(Icons.edit)),
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Arabic Category' +
                                                    ': ' +
                                                    provider
                                                        .allCategories![index]!
                                                        .nameAr,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'English Category' +
                                                    ': ' +
                                                    provider
                                                        .allCategories![index]!
                                                        .nameEn,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                              );
                            })),
                  ),
                ]),
              ),
            ),
          );
        }));
  }
  //),
  // );
}
//}

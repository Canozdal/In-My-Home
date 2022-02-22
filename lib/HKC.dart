void main() {
  List productList = [];
  var product1 = Product(productId: "milk",shelfLife: 10);
  var product2 = Product(productId: "milk", shelfLife: 4);
  var product3 = Product(productId: "milk", shelfLife: 7);
  var product4 = Product(productId: "pea",shelfLife: 9);
  var product5 = Product(productId: "pea",shelfLife: 5);
  productList = idgenerator(productList, product1);
  productList = idgenerator(productList, product2);
  productList = idgenerator(productList, product3);
  productList = idgenerator(productList, product4);
  productList = idgenerator(productList, product5);
  print(productList[0].productId);
  print(productList[0].id);
  print(productList[0].expirationDate);
  print(productList[1].productId);
  print(productList[1].id);
  print(productList[1].expirationDate);
  print(productList[2].productId);
  print(productList[2].id);
  print(productList[2].expirationDate);
  print(productList[3].productId);
  print(productList[3].id);
  print(productList[3].expirationDate);
  print(productList[4].productId);
  print(productList[4].id);
  print(productList[4].expirationDate);
}

class Product{
  Product({this.productId="",this.shelfLife=0});
  String productId;
  int shelfLife;
  int id = 0;
  DateTime expirationDate = DateTime.now();
  
}


List idgenerator(List updatedList, var product){
  product.id = 1;
  int check = 0;
  DateTime exp = product.expirationDate;
  if (updatedList.length > 0) {
    while (check == 0){
      check = 1;
      for (int i = 0; i < updatedList.length; i = i+1 ){
        if (updatedList[i].productId == product.productId){
          if (updatedList[i].id == product.id){
            product.id ++;
            check = 0;
          }
        }
      }
    }
  }
  product.expirationDate = exp.add(Duration(days: product.shelfLife, hours: 0, minutes: 0));
  updatedList.add(product);
  return updatedList;
}                     
                           
                           
                           
                           
                           
                           
                           
                           
                           
class BookshelfModel{

  final String bookName;
  final String describe;
  final String detail;
  BookshelfModel(this.bookName,this.describe,this.detail);
  BookshelfModel.fromJson(Map<String,dynamic> json)
      :bookName = json["bookName"],
       describe = json['describe'],
       detail = json['detail'];

  Map<String,dynamic> toJson()=>{
    'bookName':bookName,
    'describe':describe,
    'detail':detail
  };

}
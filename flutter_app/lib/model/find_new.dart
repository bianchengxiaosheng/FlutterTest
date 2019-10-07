import 'package:json_annotation/json_annotation.dart';

part 'find_new.g.dart';
//代码生成地址https://caijinglong.github.io/json2dart/index_ch.html


@JsonSerializable()
class FindNew extends Object {

  @JsonKey(name: 'bookName')
  String bookName;

  @JsonKey(name: 'describe')
  String describe;

  @JsonKey(name: 'detail')
  String detail;

  @JsonKey(name: 'picURL')
  String picURL;

  FindNew(this.bookName,this.describe,this.detail,this.picURL,);

  factory FindNew.fromJson(Map<String, dynamic> srcJson) => _$FindNewFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FindNewToJson(this);

}



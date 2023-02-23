import 'package:comiendoportriana/models/user.dart';

class Bar {
  List<BarContent>? content;
  Pageable? pageable;
  bool? last;
  int? totalPages;
  int? totalElements;
  int? size;
  int? number;
  Sort? sort;
  bool? first;
  int? numberOfElements;
  bool? empty;

  Bar(
      {this.content,
      this.pageable,
      this.last,
      this.totalPages,
      this.totalElements,
      this.size,
      this.number,
      this.sort,
      this.first,
      this.numberOfElements,
      this.empty});

  Bar.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <BarContent>[];
      json['content'].forEach((v) {
        content!.add(new BarContent.fromJson(v));
      });
    }
    pageable = json['pageable'] != null
        ? new Pageable.fromJson(json['pageable'])
        : null;
    last = json['last'];
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    size = json['size'];
    number = json['number'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    first = json['first'];
    numberOfElements = json['numberOfElements'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    if (this.pageable != null) {
      data['pageable'] = this.pageable!.toJson();
    }
    data['last'] = this.last;
    data['totalPages'] = this.totalPages;
    data['totalElements'] = this.totalElements;
    data['size'] = this.size;
    data['number'] = this.number;
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['first'] = this.first;
    data['numberOfElements'] = this.numberOfElements;
    data['empty'] = this.empty;
    return data;
  }
}

class BarContent {
  String? id;
  String? name;
  String? description;
  Owner? owner;
  String? direction;
  List<String>? images;
  List<Null>? comments;
  String? createdAt;

  BarContent(
      {this.id,
      this.name,
      this.description,
      this.owner,
      this.direction,
      this.images,
      this.comments,
      this.createdAt});

  BarContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    direction = json['direction'];
    images = json['images'].cast<String>();
    comments = json['comments'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['owner'] = this.owner;
    data['direction'] = this.direction;
    data['images'] = this.images;
    data['comments'] = this.comments;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Owner extends User {
  String? id;
  String? username;
  String? password;
  String? email;
  String? fullName;
  List<Null>? favList;
  List<Null>? comments;
  bool? accountNonExpired;
  bool? accountNonLocked;
  bool? credentialsNonExpired;
  bool? enabled;
  List<String>? roles;
  String? createdAt;
  String? lastPasswordChangeAt;
  List<Authorities>? authorities;

  Owner(
      {this.id,
      this.username,
      this.password,
      this.email,
      this.fullName,
      this.favList,
      this.comments,
      this.accountNonExpired,
      this.accountNonLocked,
      this.credentialsNonExpired,
      this.enabled,
      this.roles,
      this.createdAt,
      this.lastPasswordChangeAt,
      this.authorities});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    fullName = json['fullName'];
    favList = json['favList'];
    comments = json['comments'];

    accountNonExpired = json['accountNonExpired'];
    accountNonLocked = json['accountNonLocked'];
    credentialsNonExpired = json['credentialsNonExpired'];
    enabled = json['enabled'];
    roles = json['roles'].cast<String>();
    createdAt = json['createdAt'];
    lastPasswordChangeAt = json['lastPasswordChangeAt'];
    if (json['authorities'] != null) {
      authorities = <Authorities>[];
      json['authorities'].forEach((v) {
        authorities!.add(new Authorities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['favList'] = this.favList;
    data['comments'] = this.comments;
    data['accountNonExpired'] = this.accountNonExpired;
    data['accountNonLocked'] = this.accountNonLocked;
    data['credentialsNonExpired'] = this.credentialsNonExpired;
    data['enabled'] = this.enabled;
    data['roles'] = this.roles;
    data['createdAt'] = this.createdAt;
    data['lastPasswordChangeAt'] = this.lastPasswordChangeAt;
    if (this.authorities != null) {
      data['authorities'] = this.authorities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Authorities {
  String? authority;

  Authorities({this.authority});

  Authorities.fromJson(Map<String, dynamic> json) {
    authority = json['authority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authority'] = this.authority;
    return data;
  }
}

class Pageable {
  Sort? sort;
  int? offset;
  int? pageNumber;
  int? pageSize;
  bool? paged;
  bool? unpaged;

  Pageable(
      {this.sort,
      this.offset,
      this.pageNumber,
      this.pageSize,
      this.paged,
      this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    offset = json['offset'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['offset'] = this.offset;
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['paged'] = this.paged;
    data['unpaged'] = this.unpaged;
    return data;
  }
}

class Sort {
  bool? empty;
  bool? sorted;
  bool? unsorted;

  Sort({this.empty, this.sorted, this.unsorted});

  Sort.fromJson(Map<String, dynamic> json) {
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empty'] = this.empty;
    data['sorted'] = this.sorted;
    data['unsorted'] = this.unsorted;
    return data;
  }
}

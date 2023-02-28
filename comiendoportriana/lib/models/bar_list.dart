class BarList {
  List<BarContent>? _content;
  Pageable? _pageable;
  bool? _last;
  int? _totalPages;
  int? _totalElements;
  int? _size;
  int? _number;
  Sort? _sort;
  bool? _first;
  int? _numberOfElements;
  bool? _empty;

  BarList(
      {List<BarContent>? content,
      Pageable? pageable,
      bool? last,
      int? totalPages,
      int? totalElements,
      int? size,
      int? number,
      Sort? sort,
      bool? first,
      int? numberOfElements,
      bool? empty}) {
    if (content != null) {
      this._content = content;
    }
    if (pageable != null) {
      this._pageable = pageable;
    }
    if (last != null) {
      this._last = last;
    }
    if (totalPages != null) {
      this._totalPages = totalPages;
    }
    if (totalElements != null) {
      this._totalElements = totalElements;
    }
    if (size != null) {
      this._size = size;
    }
    if (number != null) {
      this._number = number;
    }
    if (sort != null) {
      this._sort = sort;
    }
    if (first != null) {
      this._first = first;
    }
    if (numberOfElements != null) {
      this._numberOfElements = numberOfElements;
    }
    if (empty != null) {
      this._empty = empty;
    }
  }

  List<BarContent>? get content => _content;
  set content(List<BarContent>? content) => _content = content;
  Pageable? get pageable => _pageable;
  set pageable(Pageable? pageable) => _pageable = pageable;
  bool? get last => _last;
  set last(bool? last) => _last = last;
  int? get totalPages => _totalPages;
  set totalPages(int? totalPages) => _totalPages = totalPages;
  int? get totalElements => _totalElements;
  set totalElements(int? totalElements) => _totalElements = totalElements;
  int? get size => _size;
  set size(int? size) => _size = size;
  int? get number => _number;
  set number(int? number) => _number = number;
  Sort? get sort => _sort;
  set sort(Sort? sort) => _sort = sort;
  bool? get first => _first;
  set first(bool? first) => _first = first;
  int? get numberOfElements => _numberOfElements;
  set numberOfElements(int? numberOfElements) =>
      _numberOfElements = numberOfElements;
  bool? get empty => _empty;
  set empty(bool? empty) => _empty = empty;

  BarList.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      _content = <BarContent>[];
      json['content'].forEach((v) {
        _content!.add(new BarContent.fromJson(v));
      });
    }
    _pageable = json['pageable'] != null
        ? new Pageable.fromJson(json['pageable'])
        : null;
    _last = json['last'];
    _totalPages = json['totalPages'];
    _totalElements = json['totalElements'];
    _size = json['size'];
    _number = json['number'];
    _sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    _first = json['first'];
    _numberOfElements = json['numberOfElements'];
    _empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._content != null) {
      data['content'] = this._content!.map((v) => v.toJson()).toList();
    }
    if (this._pageable != null) {
      data['pageable'] = this._pageable!.toJson();
    }
    data['last'] = this._last;
    data['totalPages'] = this._totalPages;
    data['totalElements'] = this._totalElements;
    data['size'] = this._size;
    data['number'] = this._number;
    if (this._sort != null) {
      data['sort'] = this._sort!.toJson();
    }
    data['first'] = this._first;
    data['numberOfElements'] = this._numberOfElements;
    data['empty'] = this._empty;
    return data;
  }
}

class BarContent {
  String? _id;
  String? _name;
  String? _description;
  Owner? _owner;
  String? _direction;
  String? _image;
  List<Null>? _comments;
  String? _createdAt;

  BarContent(
      {String? id,
      String? name,
      String? description,
      Owner? owner,
      String? direction,
      String? image,
      List<Null>? comments,
      String? createdAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (description != null) {
      this._description = description;
    }
    if (owner != null) {
      this._owner = owner;
    }
    if (direction != null) {
      this._direction = direction;
    }
    if (image != null) {
      this._image = image;
    }
    if (comments != null) {
      this._comments = comments;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  Owner? get owner => _owner;
  set owner(Owner? owner) => _owner = owner;
  String? get direction => _direction;
  set direction(String? direction) => _direction = direction;
  String? get image => _image;
  set image(String? image) => _image = image;
  List<Null>? get comments => _comments;
  set comments(List<Null>? comments) => _comments = comments;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;

  BarContent.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    _direction = json['direction'];
    _image = json['image'];
    _createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['description'] = this._description;
    if (this._owner != null) {
      data['owner'] = this._owner!.toJson();
    }
    data['direction'] = this._direction;
    data['image'] = this._image;

    data['createdAt'] = this._createdAt;
    return data;
  }
}

class Owner {
  String? _id;
  String? _username;
  String? _password;
  String? _email;
  String? _fullName;
  List<Null>? _favList;
  bool? _accountNonExpired;
  bool? _accountNonLocked;
  bool? _credentialsNonExpired;
  bool? _enabled;
  List<String>? _roles;
  String? _createdAt;
  String? _lastPasswordChangeAt;
  List<Authorities>? _authorities;

  Owner(
      {String? id,
      String? username,
      String? password,
      String? email,
      String? fullName,
      List<Null>? favList,
      bool? accountNonExpired,
      bool? accountNonLocked,
      bool? credentialsNonExpired,
      bool? enabled,
      List<String>? roles,
      String? createdAt,
      String? lastPasswordChangeAt,
      List<Authorities>? authorities}) {
    if (id != null) {
      this._id = id;
    }
    if (username != null) {
      this._username = username;
    }
    if (password != null) {
      this._password = password;
    }
    if (email != null) {
      this._email = email;
    }
    if (fullName != null) {
      this._fullName = fullName;
    }
    if (favList != null) {
      this._favList = favList;
    }
    if (accountNonExpired != null) {
      this._accountNonExpired = accountNonExpired;
    }
    if (accountNonLocked != null) {
      this._accountNonLocked = accountNonLocked;
    }
    if (credentialsNonExpired != null) {
      this._credentialsNonExpired = credentialsNonExpired;
    }
    if (enabled != null) {
      this._enabled = enabled;
    }
    if (roles != null) {
      this._roles = roles;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (lastPasswordChangeAt != null) {
      this._lastPasswordChangeAt = lastPasswordChangeAt;
    }
    if (authorities != null) {
      this._authorities = authorities;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get fullName => _fullName;
  set fullName(String? fullName) => _fullName = fullName;
  List<Null>? get favList => _favList;
  set favList(List<Null>? favList) => _favList = favList;
  bool? get accountNonExpired => _accountNonExpired;
  set accountNonExpired(bool? accountNonExpired) =>
      _accountNonExpired = accountNonExpired;
  bool? get accountNonLocked => _accountNonLocked;
  set accountNonLocked(bool? accountNonLocked) =>
      _accountNonLocked = accountNonLocked;
  bool? get credentialsNonExpired => _credentialsNonExpired;
  set credentialsNonExpired(bool? credentialsNonExpired) =>
      _credentialsNonExpired = credentialsNonExpired;
  bool? get enabled => _enabled;
  set enabled(bool? enabled) => _enabled = enabled;
  List<String>? get roles => _roles;
  set roles(List<String>? roles) => _roles = roles;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get lastPasswordChangeAt => _lastPasswordChangeAt;
  set lastPasswordChangeAt(String? lastPasswordChangeAt) =>
      _lastPasswordChangeAt = lastPasswordChangeAt;
  List<Authorities>? get authorities => _authorities;
  set authorities(List<Authorities>? authorities) => _authorities = authorities;

  Owner.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _username = json['username'];
    _password = json['password'];
    _email = json['email'];
    _fullName = json['fullName'];
    _accountNonExpired = json['accountNonExpired'];
    _accountNonLocked = json['accountNonLocked'];
    _credentialsNonExpired = json['credentialsNonExpired'];
    _enabled = json['enabled'];
    _roles = json['roles'].cast<String>();
    _createdAt = json['createdAt'];
    _lastPasswordChangeAt = json['lastPasswordChangeAt'];
    if (json['authorities'] != null) {
      _authorities = <Authorities>[];
      json['authorities'].forEach((v) {
        _authorities!.add(new Authorities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['username'] = this._username;
    data['password'] = this._password;
    data['email'] = this._email;
    data['fullName'] = this._fullName;
    data['accountNonExpired'] = this._accountNonExpired;
    data['accountNonLocked'] = this._accountNonLocked;
    data['credentialsNonExpired'] = this._credentialsNonExpired;
    data['enabled'] = this._enabled;
    data['roles'] = this._roles;
    data['createdAt'] = this._createdAt;
    data['lastPasswordChangeAt'] = this._lastPasswordChangeAt;
    if (this._authorities != null) {
      data['authorities'] = this._authorities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Authorities {
  String? _authority;

  Authorities({String? authority}) {
    if (authority != null) {
      this._authority = authority;
    }
  }

  String? get authority => _authority;
  set authority(String? authority) => _authority = authority;

  Authorities.fromJson(Map<String, dynamic> json) {
    _authority = json['authority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authority'] = this._authority;
    return data;
  }
}

class Pageable {
  Sort? _sort;
  int? _offset;
  int? _pageNumber;
  int? _pageSize;
  bool? _unpaged;
  bool? _paged;

  Pageable(
      {Sort? sort,
      int? offset,
      int? pageNumber,
      int? pageSize,
      bool? unpaged,
      bool? paged}) {
    if (sort != null) {
      this._sort = sort;
    }
    if (offset != null) {
      this._offset = offset;
    }
    if (pageNumber != null) {
      this._pageNumber = pageNumber;
    }
    if (pageSize != null) {
      this._pageSize = pageSize;
    }
    if (unpaged != null) {
      this._unpaged = unpaged;
    }
    if (paged != null) {
      this._paged = paged;
    }
  }

  Sort? get sort => _sort;
  set sort(Sort? sort) => _sort = sort;
  int? get offset => _offset;
  set offset(int? offset) => _offset = offset;
  int? get pageNumber => _pageNumber;
  set pageNumber(int? pageNumber) => _pageNumber = pageNumber;
  int? get pageSize => _pageSize;
  set pageSize(int? pageSize) => _pageSize = pageSize;
  bool? get unpaged => _unpaged;
  set unpaged(bool? unpaged) => _unpaged = unpaged;
  bool? get paged => _paged;
  set paged(bool? paged) => _paged = paged;

  Pageable.fromJson(Map<String, dynamic> json) {
    _sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    _offset = json['offset'];
    _pageNumber = json['pageNumber'];
    _pageSize = json['pageSize'];
    _unpaged = json['unpaged'];
    _paged = json['paged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._sort != null) {
      data['sort'] = this._sort!.toJson();
    }
    data['offset'] = this._offset;
    data['pageNumber'] = this._pageNumber;
    data['pageSize'] = this._pageSize;
    data['unpaged'] = this._unpaged;
    data['paged'] = this._paged;
    return data;
  }
}

class Sort {
  bool? _empty;
  bool? _sorted;
  bool? _unsorted;

  Sort({bool? empty, bool? sorted, bool? unsorted}) {
    if (empty != null) {
      this._empty = empty;
    }
    if (sorted != null) {
      this._sorted = sorted;
    }
    if (unsorted != null) {
      this._unsorted = unsorted;
    }
  }

  bool? get empty => _empty;
  set empty(bool? empty) => _empty = empty;
  bool? get sorted => _sorted;
  set sorted(bool? sorted) => _sorted = sorted;
  bool? get unsorted => _unsorted;
  set unsorted(bool? unsorted) => _unsorted = unsorted;

  Sort.fromJson(Map<String, dynamic> json) {
    _empty = json['empty'];
    _sorted = json['sorted'];
    _unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empty'] = this._empty;
    data['sorted'] = this._sorted;
    data['unsorted'] = this._unsorted;
    return data;
  }
}

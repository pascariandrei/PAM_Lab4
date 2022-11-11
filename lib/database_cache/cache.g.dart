// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Product extends DataClass implements Insertable<Product> {
  final int id;
  final String title;
  final String content;
  final int? category;
  const Product(
      {required this.id,
      required this.title,
      required this.content,
      this.category});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(content);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      category: serializer.fromJson<int?>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'category': serializer.toJson<int?>(category),
    };
  }

  Product copyWith(
          {int? id,
          String? title,
          String? content,
          Value<int?> category = const Value.absent()}) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        category: category.present ? category.value : this.category,
      );
  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.category == this.category);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<int?> category;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.category = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    this.category = const Value.absent(),
  })  : title = Value(title),
        content = Value(content);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<int>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'body': content,
      if (category != null) 'category': category,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<int?>? category}) {
    return ProductsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['body'] = Variable<String>(content.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, title, content, category];
  @override
  String get aliasedName => _alias ?? 'products';
  @override
  String get actualTableName => 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['body']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      category: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}category']),
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final String access;
  final String refresh;
  const Category({required this.access, required this.refresh});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['access'] = Variable<String>(access);
    map['refresh'] = Variable<String>(refresh);
    return map;
  }

  UserDataCompanion toCompanion(bool nullToAbsent) {
    return UserDataCompanion(
      access: Value(access),
      refresh: Value(refresh),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      access: serializer.fromJson<String>(json['access']),
      refresh: serializer.fromJson<String>(json['refresh']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'access': serializer.toJson<String>(access),
      'refresh': serializer.toJson<String>(refresh),
    };
  }

  Category copyWith({String? access, String? refresh}) => Category(
        access: access ?? this.access,
        refresh: refresh ?? this.refresh,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('access: $access, ')
          ..write('refresh: $refresh')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(access, refresh);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.access == this.access &&
          other.refresh == this.refresh);
}

class UserDataCompanion extends UpdateCompanion<Category> {
  final Value<String> access;
  final Value<String> refresh;
  const UserDataCompanion({
    this.access = const Value.absent(),
    this.refresh = const Value.absent(),
  });
  UserDataCompanion.insert({
    required String access,
    required String refresh,
  })  : access = Value(access),
        refresh = Value(refresh);
  static Insertable<Category> custom({
    Expression<String>? access,
    Expression<String>? refresh,
  }) {
    return RawValuesInsertable({
      if (access != null) 'access': access,
      if (refresh != null) 'refresh': refresh,
    });
  }

  UserDataCompanion copyWith({Value<String>? access, Value<String>? refresh}) {
    return UserDataCompanion(
      access: access ?? this.access,
      refresh: refresh ?? this.refresh,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (access.present) {
      map['access'] = Variable<String>(access.value);
    }
    if (refresh.present) {
      map['refresh'] = Variable<String>(refresh.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDataCompanion(')
          ..write('access: $access, ')
          ..write('refresh: $refresh')
          ..write(')'))
        .toString();
  }
}

class $UserDataTable extends UserData with TableInfo<$UserDataTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserDataTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _accessMeta = const VerificationMeta('access');
  @override
  late final GeneratedColumn<String> access = GeneratedColumn<String>(
      'access', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _refreshMeta = const VerificationMeta('refresh');
  @override
  late final GeneratedColumn<String> refresh = GeneratedColumn<String>(
      'refresh', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [access, refresh];
  @override
  String get aliasedName => _alias ?? 'user_data';
  @override
  String get actualTableName => 'user_data';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('access')) {
      context.handle(_accessMeta,
          access.isAcceptableOrUnknown(data['access']!, _accessMeta));
    } else if (isInserting) {
      context.missing(_accessMeta);
    }
    if (data.containsKey('refresh')) {
      context.handle(_refreshMeta,
          refresh.isAcceptableOrUnknown(data['refresh']!, _refreshMeta));
    } else if (isInserting) {
      context.missing(_refreshMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      access: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}access'])!,
      refresh: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}refresh'])!,
    );
  }

  @override
  $UserDataTable createAlias(String alias) {
    return $UserDataTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $ProductsTable products = $ProductsTable(this);
  late final $UserDataTable userData = $UserDataTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [products, userData];
}

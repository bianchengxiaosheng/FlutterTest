# SpringBoot 中JPA集成PostgreSql

## 什么是JPA（Java Persistence API）

Spring Data JPA, part of the larger Spring Data family, makes it easy to easily implement JPA based repositories. This module deals with enhanced support for JPA based data access layers. It makes it easier to build Spring-powered applications that use data access technologies.

Implementing a data access layer of an application has been cumbersome for quite a while. Too much boilerplate code has to be written to execute simple queries as well as perform pagination, and auditing. Spring Data JPA aims to significantly improve the implementation of data access layers by reducing the effort to the amount that’s actually needed. As a developer you write your repository interfaces, including custom finder methods, and Spring will provide the implementation automatically.

### Features

- Sophisticated support to build repositories based on Spring and JPA
- Support for [Querydsl](http://www.querydsl.com/) predicates and thus type-safe JPA queries
- Transparent auditing of domain class
- Pagination support, dynamic query execution, ability to integrate custom data access code
- Validation of `@Query` annotated queries at bootstrap time
- Support for XML based entity mapping
- JavaConfig based repository configuration by introducing `@EnableJpaRepositories`.

### 国内说法

**JPA 是指 Java Persistence API**，即 Java 的持久化规范，一开始是作为 JSR-220 的一部分。
JPA 的提出，主要是为了简化 Java EE 和 Java SE 应用开发工作，统一当时的一些不同的 ORM 技术。
一般来说，规范只是定义了一套运作的规则，也就是接口，而像我们所熟知的Hibernate 则是 JPA 的一个实现(Provider)。

JPA 定义了什么，大致有：

- ORM 映射元数据，用来将对象与表、字段关联起来
- 操作API，即完成增删改查的一套接口
- JPQL 查询语言，实现一套可移植的面向对象查询表达式

## PostgreSQL简介

PostGreSQL是一个功能强大的开源对象关系数据库管理系统(ORDBMS)，号称**世界上最先进的开源关系型数据库**
经过长达15年以上的积极开发和不断改进，PostGreSQL已在可靠性、稳定性、数据一致性等获得了很大的提升。
对比时下最流行的 MySQL 来说，PostGreSQL 拥有更灵活，更高度兼容标准的一些特性。
此外，PostGreSQL基于MIT开源协议，其开放性极高，这也是其成为各个云计算大T 主要的RDS数据库的根本原因。

## JPA中使用PostgreSQL

### 一、添加依赖包

**Spring Boot Mavn项目 Pom.xml文件**中添加依赖包

```xml
<!--jpa与postgresql-->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-jpa</artifactId>
</dependency>
<dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <!--<scope>runtime</scope>-->
</dependency>
```

### 二、配置PostgreSQL和jpa

在**application.properties**文件中添加如下：
```properties
#数据库基本信息配置
spring.datasource.url=jdbc:postgresql://127.0.0.1:5432/yourdatabase
spring.datasource.username=yourusername
spring.datasource.password=yourpassword
spring.jpa.show-sql=true
#JPA相关配置
spring.jpa.database=postgresql
spring.jpa.hibernate.ddl-auto=update
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQL9Dialect
spring.jpa.properties.hibernate.temp.use_jdbc_metadata_defaults = false
```

**注意：**

* **yourdatabase**,**yourusername**,**yourpassword**等信息是否配置正确。

* **spring.jpa.hibernate.ddl-auto** 指定为 update，这样框架会自动帮我们创建或更新表结构

### 三、定义Entity

```java
package com.book.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "bookshelf")
public class BookshelfItem {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;

    @Column(name = "bookName",nullable = false)
    private String bookName;
    @Column(name = "describe")
    private String describe;
    @Column(name = "detail")
    private String detail;

    public  String  ToString()
    {
        return bookName + "-" + describe;
    }

}
```

**注意：**

* 如果你的数据库中有自己创建的嵌套**schema**,要在**Table属性中进行写明@Table(name = "bookshelf",schema = "yourschema")**
* **bookName**这样的写法会导致如果数据库没有这个数据元，则会创建成**book_name**

### 四、定义repository

```java
package com.book.repository;

import com.book.entity.BookshelfItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookshelfRepository extends JpaRepository<BookshelfItem,Integer> {
    @Query(value = "select * from bookshelf",nativeQuery = true)
    List<BookshelfItem> GetAllBookData();
    @Query(value = "select * from bookshelf where book_name = :bookName",nativeQuery = true)
    List<BookshelfItem> GetBooksByName(@Param("bookName") String bookName);
}

```

**注意：**

* 如果**@Query中有*号**，要在尾部加上**nativeQuery = true**

### 五、定义service

```java
package com.book.service;

import com.book.entity.BookshelfItem;
import com.book.repository.BookshelfRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookshelfService {
    @Autowired
    private BookshelfRepository bookshelfRepository;
    public List<BookshelfItem> GetAll()
    {
        return  bookshelfRepository.GetAllBookData();
    }
    public List<BookshelfItem> GetNyBookname(String bookName)
    {
        return  bookshelfRepository.GetBooksByName(bookName);
    }

}

```

### 单元测试

```java
package com.book;

import com.book.entity.BookshelfItem;
import com.book.service.BookshelfService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BookApplicationTests {
    @Autowired
    BookshelfService bookshelfService;
    @Test
    public void contextLoads() {

        System.out.println("Get book All");
        List<BookshelfItem> temp = bookshelfService.GetAll();
        for (int i = 0; i < temp.size(); i++) {
            BookshelfItem item = temp.get(i);
            System.out.println(item.toString());
        }
        System.out.println("Get book by Name");
        temp = bookshelfService.GetNyBookname("boo1");
        for (int i = 0; i < temp.size(); i++) {
            BookshelfItem item = temp.get(i);
            System.out.println(item.toString());
        }
    }

}
```

本人测试结果如下(数据为我自己在数据库中添加的两条数据):

```
2019-10-08 17:01:07.646  INFO 4276 --- [           main] com.book.BookApplicationTests            : Started BookApplicationTests in 4.878 seconds (JVM running for 5.5)
Get book All
Hibernate: select * from bookshelf
BookshelfItem(id=1, bookName=boo1, describe=sdfsad, detail=sdfgdg)
BookshelfItem(id=2, bookName=boo2, describe=jkjkjk, detail=aaaaaa)
Get book by Name
Hibernate: select * from bookshelf where book_name = ?
BookshelfItem(id=1, bookName=boo1, describe=sdfsad, detail=sdfgdg)
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 5.406 s - in com.book.BookApplicationTests
```


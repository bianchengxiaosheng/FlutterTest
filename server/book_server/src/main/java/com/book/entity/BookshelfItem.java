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

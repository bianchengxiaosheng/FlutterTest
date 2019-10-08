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

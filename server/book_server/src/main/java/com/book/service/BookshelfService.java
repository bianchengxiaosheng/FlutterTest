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

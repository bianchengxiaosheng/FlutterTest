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

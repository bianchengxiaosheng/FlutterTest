package com.book.controller;

import io.swagger.annotations.Api;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("Test")
@Api(tags = "测试接口")
public class TestController {
    @GetMapping("/get")
    private String HaHa()
    {
        return "hallos";
    }
    @PostMapping("/add")
    private  boolean AddTest(@RequestBody String data){
        System.out.println(data);
        return true;
    }

    @PutMapping("/Update")
    private  boolean UpdateTest(@RequestBody String data){
        System.out.println(data);
        return true;
    }

    @DeleteMapping("/Delete/{id}")
    private  boolean DeleteTest(@PathVariable("id") int data){
        System.out.println(data);
        return true;
    }

}

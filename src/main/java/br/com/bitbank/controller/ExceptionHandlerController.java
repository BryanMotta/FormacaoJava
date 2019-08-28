package br.com.bitbank.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionHandlerController {
    @ExceptionHandler(Exception.class)
    public ModelAndView trataExceptionGenerica(Exception exception){
        System.out.println("Em todos esses anos nesse industria vital, essa(não) é a primeira vez que isso me acontece.");
        exception.printStackTrace();

        ModelAndView modelAndView = new ModelAndView("error");
        modelAndView.addObject("exception", exception);

        return modelAndView;
    }
}
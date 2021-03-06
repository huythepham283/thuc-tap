package com.nhom8.camera.controller.web;

import com.nhom8.camera.entity.ProductBrand;
import com.nhom8.camera.model.request.UserRegisterRequest;
import com.nhom8.camera.service.ProductBrandService;
import com.nhom8.camera.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/register")
public class RegisterController {
    private UserService userService;
    private ProductBrandService productBrandService;

    @Autowired
    public RegisterController(UserService userService, ProductBrandService productBrandService) {
        this.userService = userService;
        this.productBrandService = productBrandService;
    }

    @GetMapping
    public ModelAndView register(@ModelAttribute("userRegister") UserRegisterRequest userRegisterRequest) {
        ModelAndView mav = new ModelAndView("web/register");
        List<ProductBrand> lstProductBrands = productBrandService.getListProductBrand();
        mav.addObject("lstProductBrand", lstProductBrands);
        return mav;
    }

    @PostMapping
    public String register(@Valid @ModelAttribute("userRegister") UserRegisterRequest userRegisterRequest, BindingResult result, ModelMap modelMap) {
        if (result.hasErrors()) {
            List<ProductBrand> lstProductBrands = productBrandService.getListProductBrand();
            modelMap.addAttribute("lstProductBrand", lstProductBrands);
            return "web/register";
        }
        userService.saveUser(userRegisterRequest);
        modelMap.addAttribute("messenger", "Register success!");
        return "redirect:/login";
    }
}


from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class Shop:

    def __init__(self):
        self.seleniumLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def Hello_World(self):
        print("Hello Theo Madikgetla")

    @keyword
    def add_items_to_cart_and_checkout(self, productLists):
        # Gets WebElements
        #self.seleniumLib.get_webelements(" css:.card-title")
        i = 1
        productsTitles = self.seleniumLib.get_webelements(" css:.card-title")
        for productsTitle in productsTitles:
            if productsTitle.text in productLists:
                self.seleniumLib.click_button("xpath:(//*[@class='card-footer'])["+ str(i) +"]/button")

            i = i + 1

        self.seleniumLib.click_link("css:li.active a")

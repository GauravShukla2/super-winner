%@ page trimDirectiveWhitespaces=true %
%@ taglib prefix=c uri=httpjava.sun.comjspjstlcore %
%@ taglib prefix=template tagdir=WEB-INFtagsdesktoptemplate %
%@ taglib prefix=checkout tagdir=WEB-INFtagsaddonsb2ccheckoutaddondesktopcheckout %
%@ taglib prefix=cart tagdir=WEB-INFtagsdesktopcart %
%@ taglib prefix=multi-checkout tagdir=WEB-INFtagsaddonsb2ccheckoutaddondesktopcheckoutmulti %
%@ taglib prefix=spring uri=httpwww.springframework.orgtags %
%@ taglib prefix=cms uri=httphybris.comtldcmstags %
%@ taglib prefix=common tagdir=WEB-INFtagsdesktopcommon %
%@ taglib prefix=theme tagdir=WEB-INFtagssharedtheme %
%@ taglib prefix=form uri=httpwww.springframework.orgtagsform%
%@ taglib prefix=ycommerce uri=httphybris.comtldycommercetags %
 
curl value=checkoutmultiaddondelivery-methodselect var=continueSelectDeliveryMethodUrl
curl value=${previousStepUrl} var=addDeliveryAddressUrl
 
templatepage pageTitle=${pageTitle} hideHeaderLinks=true
    div id=globalMessages
 
        commonglobalMessages
 
    div
 
    multi-checkoutcheckoutProgressBar steps=${checkoutSteps} progressBarId=${progressBarId}
 
    div class=span-14 append-1
        div id=checkoutContentPanel class=clearfix
            div class=headlinespringtheme code=checkout.multi.deliveryMethod.stepHeaderdiv
            div class=descriptionpspringtheme code=checkout.multi.deliveryMethod.selectDeliveryMethodMessagepdiv
            formform id=selectDeliveryMethodForm action=${continueSelectDeliveryMethodUrl} method=get
                multi-checkoutdeliveryMethodSelector deliveryMethods=${deliveryMethods} selectedDeliveryMethodId=${cartData.deliveryMode.code}
 
                cif test=${not empty cartData.deliveryMode.code}
                    div class=form-actions
                        a class=button href=${addDeliveryAddressUrl}springtheme code=checkout.multi.cancel text=Cancela
                        button id=chooseDeliveryMethod_continue_button class=positive right show_processing_message
                            springtheme code=checkout.multi.deliveryMethod.continue text=Continue
                        button
                    div
                cif
 
                br
                div id=giftwrapPanel class=clearfix
                    div class=descriptionpbDo you want a Gift Wrapbpdiv
                    labelYeslabelinput type=radio name=gift_wrap id=gift_wrap_yes value=yes
                    labelNolabelinput type=radio name=gift_wrap id=dgift_wrap_no value=no checked=checked
                div
            formform
        div
    div
 
    multi-checkoutcheckoutOrderDetails cartData=${cartData} showShipDeliveryEntries=true showPickupDeliveryEntries=false showTax=false
    cmspageSlot position=SideContent var=feature element=div class=span-24 side-content-slot cms_disp-img_slot
        cmscomponent component=${feature}
    cmspageSlot
 
templatepage
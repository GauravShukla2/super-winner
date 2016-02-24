%@ page trimDirectiveWhitespaces=true %
%@ taglib prefix=c uri=httpjava.sun.comjspjstlcore%
%@ taglib prefix=template tagdir=WEB-INFtagsdesktoptemplate %
%@ taglib prefix=theme tagdir=WEB-INFtagssharedtheme %
%@ taglib prefix=nav tagdir=WEB-INFtagsdesktopnav %
%@ taglib prefix=spring uri=httpwww.springframework.orgtags %
%@ taglib prefix=form uri=httpwww.springframework.orgtagsform %
%@ taglib prefix=cms uri=httphybris.comtldcmstags %
%@ taglib prefix=fmt uri=httpjava.sun.comjspjstlfmt %
%@ taglib prefix=fn uri=httpjava.sun.comjspjstlfunctions %
%@ taglib prefix=common tagdir=WEB-INFtagsdesktopcommon %
%@ taglib prefix=breadcrumb tagdir=WEB-INFtagsdesktopnavbreadcrumb %
%@ taglib prefix=multi-checkout tagdir=WEB-INFtagsaddonsb2ccheckoutaddondesktopcheckoutmulti %
%@ taglib prefix=address tagdir=WEB-INFtagsdesktopaddress %
 
 
curl value=${nextStepUrl} var=continueSelectGiftWrapUrl
curl value=${previousStepUrl} var=cancelSelectGiftWrapUrl
 
templatepage pageTitle=${pageTitle} hideHeaderLinks=true
 
 div id=globalMessages
        commonglobalMessages
  div
 
    multi-checkoutcheckoutProgressBar steps=${checkoutSteps} progressBarId=${progressBarId}
 
    div class=span-14 append-1
        div id=checkoutContentPanel class=clearfix
            div class=descriptionpbGift wrap Stepbpdiv
            a class=button href=${cancelSelectGiftWrapUrl}springtheme code=checkout.multi.cancel text=Cancela
            a class=button href=${continueSelectGiftWrapUrl}springtheme code=checkout.multi.deliveryMethod.continue text=Continuea
        div
    div
 
    multi-checkoutcheckoutOrderDetails cartData=${cartData} showShipDeliveryEntries=true showPickupDeliveryEntries=true showTax=false
    cmspageSlot position=SideContent var=feature element=div class=span-24 side-content-slot cms_disp-img_slot
        cmscomponent component=${feature}
    cmspageSlot
 
templatepage 
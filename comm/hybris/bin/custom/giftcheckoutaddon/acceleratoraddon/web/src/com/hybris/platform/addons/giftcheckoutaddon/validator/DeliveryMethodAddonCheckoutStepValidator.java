package com.hybris.platform.addons.giftcheckoutaddon.validator;
import de.hybris.platform.acceleratorstorefrontcommons.checkout.steps.validation.ValidationResults;
import de.hybris.platform.servicelayer.session.SessionService;
import de.hybris.platform.storefront.checkout.steps.validation.impl.DefaultDeliveryMethodCheckoutStepValidator;
import org.springframework.beans.factory.annotation.Required;
 
public class DeliveryMethodAddonCheckoutStepValidator extends DefaultDeliveryMethodCheckoutStepValidator
{
    private SessionService sessionService;
    @Override
    public ValidationResults validateOnExit()
    {
        final String giftWrapSelection = getSessionService().getAttribute("GIFT_WRAP");
        if (giftWrapSelection != null && giftWrapSelection.equals("YES"))
        {
            return ValidationResults.REDIRECT_TO_DUMMY_STEP;
        }
        if (getCheckoutFacade().hasPickUpItems())
        {
            return ValidationResults.REDIRECT_TO_PICKUP_LOCATION;
        }
        return ValidationResults.SUCCESS;
    }
    public SessionService getSessionService()
    {
        return sessionService;
    }
    @Required
    public void setSessionService(final SessionService sessionService)
    {
        this.sessionService = sessionService;
    }
}
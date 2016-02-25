package com.hybris.gift.facades.order;
 
import com.hybris.gift.facades.order.data.OrderCancelResultData;
import de.hybris.platform.commercefacades.order.data.OrderData;
 
 
/**
 * Facade for order cancel functionality.
 *
 */
public interface OrderCancelFacade
{
    /**
     * Attempts to cancel the order.
     *
     * @param order
     *           - {@link OrderData} representing an order to be cancelled
     * @return {@link OrderCancelResultData}
     */
    OrderCancelResultData cancelOrder(OrderData order);
}
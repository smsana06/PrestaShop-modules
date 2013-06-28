{*
** @author PrestaShop SA <contact@prestashop.com>
** @copyright  2007-2013 PrestaShop SA
** @version  Release: $Revision: 1.2.0 $
**
** International Registered Trademark & Property of PrestaShop SA
**
** Description: PayPal "Express Checkout" error/warning page
**
** This template is displayed to the customer upon any error received from PayPal
**
** Step 1: The customer is using PayPal Express Checkout to place an order
** Step 2: Your store is communicating with PayPal using your API credentials
** Step 3: If you store is receiving an error from the PayPal API, this one is displayed to the customer
** Step 4: If the error code is specifically 10486, it means that the funding source selected by the customer has no funds
** Therefore, we offer to him/her to go back to PayPal to select another funding source
** For any other error, we are inviting the customer to contact your Customer service via the contact page
**
*}
<h1>{l s='Unexpected payment error' mod='paypalusa'}</h1>
{if isset($paypal_usa_errors.L_ERRORCODE0) && $paypal_usa_errors.L_ERRORCODE0 == 10486}
	<div class="error">
		<p><b>{l s='Unfortunately, the payment was declined by PayPal for one of the following reasons:' mod='paypalusa'}</b></p>
		<ul style="margin: 0px 0 15px 30px;">
			<li>{l s='Billing address could not be confirmed' mod='paypalusa'}</li>
			<li>{l s='Transaction exceeds the card limit' mod='paypalusa'}</li>
			<li>{l s='Transaction denied by the card issuer' mod='paypalusa'}</li>
		</ul>
		<p>{l s='Details:' mod='paypalusa'}
		{l s='Short Error Message:' mod='paypalusa'} {$paypal_usa_errors.L_SHORTMESSAGE0|escape:'htmlall':'UTF-8'}<br />
		{l s='Detailed Error Message:' mod='paypalusa'} {$paypal_usa_errors.L_LONGMESSAGE0|escape:'htmlall':'UTF-8'}<br />
		{l s='Error Code:' mod='paypalusa'} {$paypal_usa_errors.L_ERRORCODE0|escape:'htmlall':'UTF-8'}</p>
		<p><b>{l s='Please click again on the PayPal Express Checkout button below and select another funding source on the PayPal website:' mod='paypalusa'}</b></p>
		{include file='../hooks/express-checkout.tpl' paypal_usa_from_error=1}
	</div>	
{else}
<p class="{if $paypal_usa_errors.ACK == 'Failure'}error{else}info{/if}">
	<b>{l s='Unfortunately, an error occured while communicating with PayPal.' mod='paypalusa'}</b><br /><br />
	{l s='Short Error Message:' mod='paypalusa'} {$paypal_usa_errors.L_SHORTMESSAGE0|escape:'htmlall':'UTF-8'}<br />
	{l s='Detailed Error Message:' mod='paypalusa'} {$paypal_usa_errors.L_LONGMESSAGE0|escape:'htmlall':'UTF-8'}<br />
	{l s='Error Code:' mod='paypalusa'} {$paypal_usa_errors.L_ERRORCODE0|escape:'htmlall':'UTF-8'}<br />
	{l s='Please' mod='paypalusa'} <b><a href="{$link->getPageLink('contact', true)}">{l s='contact our Customer service' mod='paypalusa'}</a></b> {l s='and mention this error code to get this issue resolved.' mod='paypalusa'}<br />
</p>
{/if}
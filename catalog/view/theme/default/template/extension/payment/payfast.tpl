<form action="<?php echo $action; ?>" method="post">
  <input type="hidden" name="MERCHANT_ID" value="<?php echo $merchant_id; ?>" />
  <input type="hidden" name="MERCHANT_NAME" value="<?php echo $merchant_name; ?>" />
  
  <input type="hidden" name="TOKEN" value="<?php echo $token; ?>" />
  <input type="hidden" name="SUCCESS_URL" value="<?php echo $success_url; ?>" />
  <input type="hidden" name="FAILURE_URL" value="<?php echo $failure_url; ?>" />
  <input type="hidden" name="CHECKOUT_URL" value="<?php echo $checkout_url; ?>" />  
  <input type="hidden" name="CUSTOMER_EMAIL_ADDRESS" value="<?php echo $customer_email; ?>" />
  <input type="hidden" name="CUSTOMER_MOBILE_NO" value="<?php echo $customer_mobile; ?>" />
  <input type="hidden" name="TXNAMT" value=<?php echo $txnamt; ?> />
  <input type="hidden" name="BASKET_ID" value="<?php echo $basket_id; ?>" />
  <input type="hidden" name="ORDER_DATE" value="<?php echo $order_date; ?>" />
  <input type="hidden" name="SIGNATURE" value="<?php echo $signature; ?>" />
  <input type="hidden" name="VERSION" value="<?php echo $version; ?>" />
  <input type="hidden" name="TXNDESC" value="<?php echo $txndesc; ?>" />
  <input type="hidden" name="PROCCODE" value=00 />
  
  <div class="buttons">
    <div class="pull-right">
      <input type="submit" value="<?php echo $button_confirm; ?>" class="btn btn-primary" />
    </div>
  </div>
</form>



<?php echo $header; ?><?php echo $column_left; ?>
<?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-payment" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>

        </div>
    </div>
    <div class="container-fluid">
        <?php  if ($error_warning){ ?>
        <div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php  } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-payment" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-merchant-id"><?php echo $entry_merchant_id; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="payfast_merchant_id" value="<?php echo $payment_payfast_merchant_id; ?>" placeholder="<?php echo $entry_merchant_id; ?>" id="input-merchant-id" class="form-control" />
                            <?php  if($error_merchant_id){ ?>
                            <div class="text-danger"><?php echo $error_merchant_id; ?></div>
                            <?php  } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-security-key"><?php echo $entry_security_key ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="payfast_security_key" value="<?php echo $payment_payfast_security_key; ?>" placeholder="<?php echo $entry_security_key; ?>" id="input-security-key" class="form-control" />
                            <?php  if ($error_security_key){ ?>
                            <div class="text-danger"><?php echo $error_security_key?></div>
                            <?php  } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-secret"><?php echo $entry_merchant_name; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="payfast_merchant_name" value="<?php echo $payment_payfast_merchant_name; ?>" placeholder="<?php echo $entry_merchant_name; ?>" id="input-merchant-namey" class="form-control" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
                        <div class="col-sm-10">
                            <select name="payfast_order_status_id" id="input-order-status" class="form-control">
                                <?php foreach( $order_statuses as $order_status){ ?>
                                
                                    <?php  if ($order_status['order_status_id'] == $payment_payfast_order_status_id) { ?>
                                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                    <?php  } else { ?>
                                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                    <?php  } ?>
                                <?php  } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-pending-status"><?php echo $entry_pending_status; ?></label>
                        <div class="col-sm-10">
                            <select name="payfast_pending_status_id" id="input-pending-status" class="form-control">
                                <?php  foreach($order_statuses as $order_status){ ?>
                                <?php  if ($order_status['order_status_id'] == $payment_payfast_pending_status_id){ ?>
                                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                    <?php  } else { ?>
                                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                <?php  } ?>
                                <?php  } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-pending-status"><?php echo $entry_canceled_status; ?></label>
                        <div class="col-sm-10">
                            <select name="payfast_canceled_status_id" id="input-pending-status" class="form-control">
                                <?php  foreach($order_statuses as $order_status){ ?>
                                <?php  if ($order_status['order_status_id'] == $payment_payfast_canceled_status_id){ ?>
                                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                    <?php  } else { ?>
                                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                <?php  } ?>
                                <?php  } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-failed-status"><?php echo $entry_failed_status; ?></label>
                        <div class="col-sm-10">
                            <select name="payfast_failed_status_id" id="input-pending-status" class="form-control">
                                <?php  foreach($order_statuses as $order_status){ ?>
                                <?php  if ($order_status['order_status_id'] == $payment_payfast_failed_status_id){ ?>
                                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                    <?php  } else { ?>
                                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                <?php  } ?>
                                <?php  } ?>
                            </select>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
                        <div class="col-sm-10">
                            <select name="payfast_geo_zone_id" id="input-geo-zone" class="form-control">
                                <option value="0"><?php echo $text_all_zones; ?></option>
                                <?php  foreach($geo_zones as $geo_zone){ ?>
                                <?php  if($geo_zone['geo_zone_id'] == $payment_payfast_geo_zone_id){ ?>
                                <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                                <?php  } else { ?>
                                <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                                <?php  } ?>
                                <?php  } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                        <div class="col-sm-10">
                            <select name="payfast_status" id="input-status" class="form-control">
                                <?php  if ($payment_payfast_status) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php  } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php  } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="payfast_sort_order" value="<?php echo $payment_payfast_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>
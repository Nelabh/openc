<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/setting.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><a href="#tab-store"><?php echo $tab_store; ?></a><a href="#tab-local"><?php echo $tab_local; ?></a><a href="#tab-option"><?php echo $tab_option; ?></a><a href="#tab-image"><?php echo $tab_image; ?></a><a href="#tab-ftp"><?php echo $tab_ftp; ?></a><a href="#tab-mail"><?php echo $tab_mail; ?></a><a href="#tab-fraud"><?php echo $tab_fraud; ?></a>
				<!--
				/**
					*Ajax advanced search starts
					*/
				-->
				<a href="#tab-server"><?php echo $tab_server; ?></a>
				<a href="#tab-ajaxadvancedsearch"><?php echo $tab_ajaxadvancedsearch; ?></a>
				<!--	
				/**
					*Ajax advanced search ends
					*/
				-->	
			</div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
          <table class="form">
            <tr>
              <td><span class="required">*</span> <?php echo $entry_name; ?></td>
              <td><input type="text" name="config_name" value="<?php echo $config_name; ?>" size="40" />
                <?php if ($error_name) { ?>
                <span class="error"><?php echo $error_name; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_owner; ?></td>
              <td><input type="text" name="config_owner" value="<?php echo $config_owner; ?>" size="40" />
                <?php if ($error_owner) { ?>
                <span class="error"><?php echo $error_owner; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_address; ?></td>
              <td><textarea name="config_address" cols="40" rows="5"><?php echo $config_address; ?></textarea>
                <?php if ($error_address) { ?>
                <span class="error"><?php echo $error_address; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_email; ?></td>
              <td><input type="text" name="config_email" value="<?php echo $config_email; ?>" size="40" />
                <?php if ($error_email) { ?>
                <span class="error"><?php echo $error_email; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_telephone; ?></td>
              <td><input type="text" name="config_telephone" value="<?php echo $config_telephone; ?>" />
                <?php if ($error_telephone) { ?>
                <span class="error"><?php echo $error_telephone; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_fax; ?></td>
              <td><input type="text" name="config_fax" value="<?php echo $config_fax; ?>" /></td>
            </tr>
          </table>
        </div>
        <div id="tab-store">
          <table class="form">
            <tr>
              <td><span class="required">*</span> <?php echo $entry_title; ?></td>
              <td><input type="text" name="config_title" value="<?php echo $config_title; ?>" />
                <?php if ($error_title) { ?>
                <span class="error"><?php echo $error_title; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_meta_description; ?></td>
              <td><textarea name="config_meta_description" cols="40" rows="5"><?php echo $config_meta_description; ?></textarea></td>
            </tr>
            <tr>
              <td><?php echo $entry_template; ?></td>
              <td><select name="config_template" onchange="$('#template').load('index.php?route=setting/setting/template&token=<?php echo $token; ?>&template=' + encodeURIComponent(this.value));">
                  <?php foreach ($templates as $template) { ?>
                  <?php if ($template == $config_template) { ?>
                  <option value="<?php echo $template; ?>" selected="selected"><?php echo $template; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $template; ?>"><?php echo $template; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td></td>
              <td id="template"></td>
            </tr>
            <tr>
              <td><?php echo $entry_layout; ?></td>
              <td><select name="config_layout_id">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $config_layout_id) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
        </div>
        <div id="tab-local">
          <table class="form">
            <tr>
              <td><?php echo $entry_country; ?></td>
              <td><select name="config_country_id">
                  <?php foreach ($countries as $country) { ?>
                  <?php if ($country['country_id'] == $config_country_id) { ?>
                  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_zone; ?></td>
              <td><select name="config_zone_id">
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_language; ?></td>
              <td><select name="config_language">
                  <?php foreach ($languages as $language) { ?>
                  <?php if ($language['code'] == $config_language) { ?>
                  <option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_admin_language; ?></td>
              <td><select name="config_admin_language">
                  <?php foreach ($languages as $language) { ?>
                  <?php if ($language['code'] == $config_admin_language) { ?>
                  <option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_currency; ?></td>
              <td><select name="config_currency">
                  <?php foreach ($currencies as $currency) { ?>
                  <?php if ($currency['code'] == $config_currency) { ?>
                  <option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_currency_auto; ?></td>
              <td><?php if ($config_currency_auto) { ?>
                <input type="radio" name="config_currency_auto" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_currency_auto" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_currency_auto" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_currency_auto" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_length_class; ?></td>
              <td><select name="config_length_class_id">
                  <?php foreach ($length_classes as $length_class) { ?>
                  <?php if ($length_class['length_class_id'] == $config_length_class_id) { ?>
                  <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_weight_class; ?></td>
              <td><select name="config_weight_class_id">
                  <?php foreach ($weight_classes as $weight_class) { ?>
                  <?php if ($weight_class['weight_class_id'] == $config_weight_class_id) { ?>
                  <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
        </div>
        <div id="tab-option">
          <h2><?php echo $text_items; ?></h2>
          <table class="form">
            <tr>
              <td><span class="required">*</span> <?php echo $entry_catalog_limit; ?></td>
              <td><input type="text" name="config_catalog_limit" value="<?php echo $config_catalog_limit; ?>" size="3" />
                <?php if ($error_catalog_limit) { ?>
                <span class="error"><?php echo $error_catalog_limit; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_admin_limit; ?></td>
              <td><input type="text" name="config_admin_limit" value="<?php echo $config_admin_limit; ?>" size="3" />
                <?php if ($error_admin_limit) { ?>
                <span class="error"><?php echo $error_admin_limit; ?></span>
                <?php } ?></td>
            </tr>
          </table>
          <h2><?php echo $text_product; ?></h2>
          <table class="form">
            <tr>
              <td><?php echo $entry_product_count; ?></td>
              <td><?php if ($config_product_count) { ?>
                <input type="radio" name="config_product_count" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_product_count" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_product_count" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_product_count" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_review; ?></td>
              <td><?php if ($config_review_status) { ?>
                <input type="radio" name="config_review_status" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_review_status" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_review_status" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_review_status" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_download; ?></td>
              <td><?php if ($config_download) { ?>
                <input type="radio" name="config_download" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_download" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_download" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_download" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>          
          </table>
          <h2><?php echo $text_voucher; ?></h2>
          <table class="form">
            <tr>
              <td><span class="required">*</span> <?php echo $entry_voucher_min; ?></td>
              <td><input type="text" name="config_voucher_min" value="<?php echo $config_voucher_min; ?>" />
                <?php if ($error_voucher_min) { ?>
                <span class="error"><?php echo $error_voucher_min; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_voucher_max; ?></td>
              <td><input type="text" name="config_voucher_max" value="<?php echo $config_voucher_max; ?>" />
                <?php if ($error_voucher_max) { ?>
                <span class="error"><?php echo $error_voucher_max; ?></span>
                <?php } ?></td>
            </tr>
          </table>
          <h2><?php echo $text_tax; ?></h2>
          <table class="form">
            <tr>
              <td><?php echo $entry_tax; ?></td>
              <td><?php if ($config_tax) { ?>
                <input type="radio" name="config_tax" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_tax" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_tax" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_tax" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_vat; ?></td>
              <td><?php if ($config_vat) { ?>
                <input type="radio" name="config_vat" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_vat" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_vat" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_vat" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_tax_default; ?></td>
              <td><select name="config_tax_default">
                  <option value=""><?php echo $text_none; ?></option>
                  <?php  if ($config_tax_default == 'shipping') { ?>
                  <option value="shipping" selected="selected"><?php echo $text_shipping; ?></option>
                  <?php } else { ?>
                  <option value="shipping"><?php echo $text_shipping; ?></option>
                  <?php } ?>
                  <?php  if ($config_tax_default == 'payment') { ?>
                  <option value="payment" selected="selected"><?php echo $text_payment; ?></option>
                  <?php } else { ?>
                  <option value="payment"><?php echo $text_payment; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_tax_customer; ?></td>
              <td><select name="config_tax_customer">
                  <option value=""><?php echo $text_none; ?></option>
                  <?php  if ($config_tax_customer == 'shipping') { ?>
                  <option value="shipping" selected="selected"><?php echo $text_shipping; ?></option>
                  <?php } else { ?>
                  <option value="shipping"><?php echo $text_shipping; ?></option>
                  <?php } ?>
                  <?php  if ($config_tax_customer == 'payment') { ?>
                  <option value="payment" selected="selected"><?php echo $text_payment; ?></option>
                  <?php } else { ?>
                  <option value="payment"><?php echo $text_payment; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
          <h2><?php echo $text_account; ?></h2>
          <table class="form">
            <tr>
              <td><?php echo $entry_customer_online; ?></td>
              <td><?php if ($config_customer_online) { ?>
                <input type="radio" name="config_customer_online" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_customer_online" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_customer_online" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_customer_online" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_customer_group; ?></td>
              <td><select name="config_customer_group_id">
                  <?php foreach ($customer_groups as $customer_group) { ?>
                  <?php if ($customer_group['customer_group_id'] == $config_customer_group_id) { ?>
                  <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_customer_group_display; ?></td>
              <td><div class="scrollbox">
                  <?php $class = 'odd'; ?>
                  <?php foreach ($customer_groups as $customer_group) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array($customer_group['customer_group_id'], $config_customer_group_display)) { ?>
                    <input type="checkbox" name="config_customer_group_display[]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                    <?php echo $customer_group['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="config_customer_group_display[]" value="<?php echo $customer_group['customer_group_id']; ?>" />
                    <?php echo $customer_group['name']; ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div>
                <?php if ($error_customer_group_display) { ?>
                <span class="error"><?php echo $error_customer_group_display; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_customer_price; ?></td>
              <td><?php if ($config_customer_price) { ?>
                <input type="radio" name="config_customer_price" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_customer_price" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_customer_price" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_customer_price" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_account; ?></td>
              <td><select name="config_account_id">
                  <option value="0"><?php echo $text_none; ?></option>
                  <?php foreach ($informations as $information) { ?>
                  <?php if ($information['information_id'] == $config_account_id) { ?>
                  <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
          <h2><?php echo $text_checkout; ?></h2>
          <table class="form">
            <tr>
              <td><?php echo $entry_cart_weight; ?></td>
              <td><?php if ($config_cart_weight) { ?>
                <input type="radio" name="config_cart_weight" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_cart_weight" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_cart_weight" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_cart_weight" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_guest_checkout; ?></td>
              <td><?php if ($config_guest_checkout) { ?>
                <input type="radio" name="config_guest_checkout" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_guest_checkout" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_guest_checkout" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_guest_checkout" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_checkout; ?></td>
              <td><select name="config_checkout_id">
                  <option value="0"><?php echo $text_none; ?></option>
                  <?php foreach ($informations as $information) { ?>
                  <?php if ($information['information_id'] == $config_checkout_id) { ?>
                  <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_order_edit; ?></td>
              <td><input type="text" name="config_order_edit" value="<?php echo $config_order_edit; ?>" size="3" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_invoice_prefix; ?></td>
              <td><input type="text" name="config_invoice_prefix" value="<?php echo $config_invoice_prefix; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_order_status; ?></td>
              <td><select name="config_order_status_id">
                  <?php foreach ($order_statuses as $order_status) { ?>
                  <?php if ($order_status['order_status_id'] == $config_order_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_complete_status; ?></td>
              <td><select name="config_complete_status_id">
                  <?php foreach ($order_statuses as $order_status) { ?>
                  <?php if ($order_status['order_status_id'] == $config_complete_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
          <h2><?php echo $text_stock; ?></h2>
          <table class="form">
            <tr>
              <td><?php echo $entry_stock_display; ?></td>
              <td><?php if ($config_stock_display) { ?>
                <input type="radio" name="config_stock_display" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_stock_display" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_stock_display" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_stock_display" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_stock_warning; ?></td>
              <td><?php if ($config_stock_warning) { ?>
                <input type="radio" name="config_stock_warning" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_stock_warning" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_stock_warning" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_stock_warning" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_stock_checkout; ?></td>
              <td><?php if ($config_stock_checkout) { ?>
                <input type="radio" name="config_stock_checkout" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_stock_checkout" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_stock_checkout" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_stock_checkout" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_stock_status; ?></td>
              <td><select name="config_stock_status_id">
                  <?php foreach ($stock_statuses as $stock_status) { ?>
                  <?php if ($stock_status['stock_status_id'] == $config_stock_status_id) { ?>
                  <option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
          <h2><?php echo $text_affiliate; ?></h2>
          <table class="form">
            <tr>
              <td><?php echo $entry_affiliate; ?></td>
              <td><select name="config_affiliate_id">
                  <option value="0"><?php echo $text_none; ?></option>
                  <?php foreach ($informations as $information) { ?>
                  <?php if ($information['information_id'] == $config_affiliate_id) { ?>
                  <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_commission; ?></td>
              <td><input type="text" name="config_commission" value="<?php echo $config_commission; ?>" size="3" /></td>
            </tr>
          </table>
          <h2><?php echo $text_return; ?></h2>
          <table class="form">
            <tr>
              <td><?php echo $entry_return; ?></td>
              <td><select name="config_return_id">
                  <option value="0"><?php echo $text_none; ?></option>
                  <?php foreach ($informations as $information) { ?>
                  <?php if ($information['information_id'] == $config_return_id) { ?>
                  <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_return_status; ?></td>
              <td><select name="config_return_status_id">
                  <?php foreach ($return_statuses as $return_status) { ?>
                  <?php if ($return_status['return_status_id'] == $config_return_status_id) { ?>
                  <option value="<?php echo $return_status['return_status_id']; ?>" selected="selected"><?php echo $return_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $return_status['return_status_id']; ?>"><?php echo $return_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
        </div>
        <div id="tab-image">
          <table class="form">
            <tr>
              <td><?php echo $entry_logo; ?></td>
              <td><div class="image"><img src="<?php echo $logo; ?>" alt="" id="thumb-logo" />
                  <input type="hidden" name="config_logo" value="<?php echo $config_logo; ?>" id="logo" />
                  <br />
                  <a onclick="image_upload('logo', 'thumb-logo');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-logo').attr('src', '<?php echo $no_image; ?>'); $('#logo').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
            </tr>
            <tr>
              <td><?php echo $entry_icon; ?></td>
              <td><div class="image"><img src="<?php echo $icon; ?>" alt="" id="thumb-icon" />
                  <input type="hidden" name="config_icon" value="<?php echo $config_icon; ?>" id="icon" />
                  <br />
                  <a onclick="image_upload('icon', 'thumb-icon');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-icon').attr('src', '<?php echo $no_image; ?>'); $('#icon').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_category; ?></td>
              <td><input type="text" name="config_image_category_width" value="<?php echo $config_image_category_width; ?>" size="3" />
                x
                <input type="text" name="config_image_category_height" value="<?php echo $config_image_category_height; ?>" size="3" />
                <?php if ($error_image_category) { ?>
                <span class="error"><?php echo $error_image_category; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_thumb; ?></td>
              <td><input type="text" name="config_image_thumb_width" value="<?php echo $config_image_thumb_width; ?>" size="3" />
                x
                <input type="text" name="config_image_thumb_height" value="<?php echo $config_image_thumb_height; ?>" size="3" />
                <?php if ($error_image_thumb) { ?>
                <span class="error"><?php echo $error_image_thumb; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_popup; ?></td>
              <td><input type="text" name="config_image_popup_width" value="<?php echo $config_image_popup_width; ?>" size="3" />
                x
                <input type="text" name="config_image_popup_height" value="<?php echo $config_image_popup_height; ?>" size="3" />
                <?php if ($error_image_popup) { ?>
                <span class="error"><?php echo $error_image_popup; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_product; ?></td>
              <td><input type="text" name="config_image_product_width" value="<?php echo $config_image_product_width; ?>" size="3" />
                x
                <input type="text" name="config_image_product_height" value="<?php echo $config_image_product_height; ?>" size="3" />
                <?php if ($error_image_product) { ?>
                <span class="error"><?php echo $error_image_product; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_additional; ?></td>
              <td><input type="text" name="config_image_additional_width" value="<?php echo $config_image_additional_width; ?>" size="3" />
                x
                <input type="text" name="config_image_additional_height" value="<?php echo $config_image_additional_height; ?>" size="3" />
                <?php if ($error_image_additional) { ?>
                <span class="error"><?php echo $error_image_additional; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_related; ?></td>
              <td><input type="text" name="config_image_related_width" value="<?php echo $config_image_related_width; ?>" size="3" />
                x
                <input type="text" name="config_image_related_height" value="<?php echo $config_image_related_height; ?>" size="3" />
                <?php if ($error_image_related) { ?>
                <span class="error"><?php echo $error_image_related; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_compare; ?></td>
              <td><input type="text" name="config_image_compare_width" value="<?php echo $config_image_compare_width; ?>" size="3" />
                x
                <input type="text" name="config_image_compare_height" value="<?php echo $config_image_compare_height; ?>" size="3" />
                <?php if ($error_image_compare) { ?>
                <span class="error"><?php echo $error_image_compare; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_wishlist; ?></td>
              <td><input type="text" name="config_image_wishlist_width" value="<?php echo $config_image_wishlist_width; ?>" size="3" />
                x
                <input type="text" name="config_image_wishlist_height" value="<?php echo $config_image_wishlist_height; ?>" size="3" />
                <?php if ($error_image_wishlist) { ?>
                <span class="error"><?php echo $error_image_wishlist; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_image_cart; ?></td>
              <td><input type="text" name="config_image_cart_width" value="<?php echo $config_image_cart_width; ?>" size="3" />
                x
                <input type="text" name="config_image_cart_height" value="<?php echo $config_image_cart_height; ?>" size="3" />
                <?php if ($error_image_cart) { ?>
                <span class="error"><?php echo $error_image_cart; ?></span>
                <?php } ?></td>
            </tr>
          </table>
        </div>
        <div id="tab-ftp">
          <table class="form">
            <tr>
              <td><?php echo $entry_ftp_host; ?></td>
              <td><input type="text" name="config_ftp_host" value="<?php echo $config_ftp_host; ?>" />
                <?php if ($error_ftp_host) { ?>
                <span class="error"><?php echo $error_ftp_host; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_ftp_port; ?></td>
              <td><input type="text" name="config_ftp_port" value="<?php echo $config_ftp_port; ?>" />
                <?php if ($error_ftp_port) { ?>
                <span class="error"><?php echo $error_ftp_port; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_ftp_username; ?></td>
              <td><input type="text" name="config_ftp_username" value="<?php echo $config_ftp_username; ?>" />
                <?php if ($error_ftp_username) { ?>
                <span class="error"><?php echo $error_ftp_username; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_ftp_password; ?></td>
              <td><input type="text" name="config_ftp_password" value="<?php echo $config_ftp_password; ?>" />
                <?php if ($error_ftp_password) { ?>
                <span class="error"><?php echo $error_ftp_password; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_ftp_root; ?></td>
              <td><input type="text" name="config_ftp_root" value="<?php echo $config_ftp_root; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_ftp_status; ?></td>
              <td><?php if ($config_ftp_status) { ?>
                <input type="radio" name="config_ftp_status" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_ftp_status" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_ftp_status" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_ftp_status" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
          </table>
        </div>
        <div id="tab-mail">
          <table class="form">
            <tr>
              <td><?php echo $entry_mail_protocol; ?></td>
              <td><select name="config_mail_protocol">
                  <?php if ($config_mail_protocol == 'mail') { ?>
                  <option value="mail" selected="selected"><?php echo $text_mail; ?></option>
                  <?php } else { ?>
                  <option value="mail"><?php echo $text_mail; ?></option>
                  <?php } ?>
                  <?php if ($config_mail_protocol == 'smtp') { ?>
                  <option value="smtp" selected="selected"><?php echo $text_smtp; ?></option>
                  <?php } else { ?>
                  <option value="smtp"><?php echo $text_smtp; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_mail_parameter; ?></td>
              <td><input type="text" name="config_mail_parameter" value="<?php echo $config_mail_parameter; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_smtp_host; ?></td>
              <td><input type="text" name="config_smtp_host" value="<?php echo $config_smtp_host; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_smtp_username; ?></td>
              <td><input type="text" name="config_smtp_username" value="<?php echo $config_smtp_username; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_smtp_password; ?></td>
              <td><input type="text" name="config_smtp_password" value="<?php echo $config_smtp_password; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_smtp_port; ?></td>
              <td><input type="text" name="config_smtp_port" value="<?php echo $config_smtp_port; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_smtp_timeout; ?></td>
              <td><input type="text" name="config_smtp_timeout" value="<?php echo $config_smtp_timeout; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_alert_mail; ?></td>
              <td><?php if ($config_alert_mail) { ?>
                <input type="radio" name="config_alert_mail" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_alert_mail" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_alert_mail" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_alert_mail" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_account_mail; ?></td>
              <td><?php if ($config_account_mail) { ?>
                <input type="radio" name="config_account_mail" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_account_mail" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_account_mail" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_account_mail" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_alert_emails; ?></td>
              <td><textarea name="config_alert_emails" cols="40" rows="5"><?php echo $config_alert_emails; ?></textarea></td>
            </tr>
          </table>
        </div>
        <div id="tab-fraud">
          <table class="form">
            <tr>
              <td><?php echo $entry_fraud_detection; ?></td>
              <td><?php if ($config_fraud_detection) { ?>
                <input type="radio" name="config_fraud_detection" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_fraud_detection" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_fraud_detection" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_fraud_detection" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_fraud_key; ?></td>
              <td><input type="text" name="config_fraud_key" value="<?php echo $config_fraud_key; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_fraud_score; ?></td>
              <td><input type="text" name="config_fraud_score" value="<?php echo $config_fraud_score; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_fraud_status; ?></td>
              <td><select name="config_fraud_status_id">
                  <?php foreach ($order_statuses as $order_status) { ?>
                  <?php if ($order_status['order_status_id'] == $config_fraud_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
        </div>
        <div id="tab-server">
          <table class="form">
            <tr>
              <td><?php echo $entry_secure; ?></td>
              <td><?php if ($config_secure) { ?>
                <input type="radio" name="config_secure" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_secure" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_secure" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_secure" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_shared; ?></td>
              <td><?php if ($config_shared) { ?>
                <input type="radio" name="config_shared" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_shared" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_shared" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_shared" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_robots; ?></td>
              <td><textarea name="config_robots" cols="40" rows="5"><?php echo $config_robots; ?></textarea></td>
            </tr>                    
            <tr>
              <td><?php echo $entry_seo_url; ?></td>
              <td><?php if ($config_seo_url) { ?>
                <input type="radio" name="config_seo_url" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_seo_url" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_seo_url" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_seo_url" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_file_extension_allowed; ?></td>
              <td><textarea name="config_file_extension_allowed" cols="40" rows="5"><?php echo $config_file_extension_allowed; ?></textarea></td>
            </tr>
            <tr>
              <td><?php echo $entry_file_mime_allowed; ?></td>
              <td><textarea name="config_file_mime_allowed" cols="60" rows="5"><?php echo $config_file_mime_allowed; ?></textarea></td>
            </tr>              
            <tr>
              <td><?php echo $entry_maintenance; ?></td>
              <td><?php if ($config_maintenance) { ?>
                <input type="radio" name="config_maintenance" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_maintenance" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_maintenance" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_maintenance" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_password; ?></td>
              <td><?php if ($config_password) { ?>
                <input type="radio" name="config_password" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_password" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_password" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_password" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>            
            <tr>
              <td><?php echo $entry_encryption; ?></td>
              <td><input type="text" name="config_encryption" value="<?php echo $config_encryption; ?>" />
                <?php if ($error_encryption) { ?>
                <span class="error"><?php echo $error_encryption; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_compression; ?></td>
              <td><input type="text" name="config_compression" value="<?php echo $config_compression; ?>" size="3" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_error_display; ?></td>
              <td><?php if ($config_error_display) { ?>
                <input type="radio" name="config_error_display" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_error_display" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_error_display" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_error_display" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_error_log; ?></td>
              <td><?php if ($config_error_log) { ?>
                <input type="radio" name="config_error_log" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_error_log" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_error_log" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_error_log" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_error_filename; ?></td>
              <td><input type="text" name="config_error_filename" value="<?php echo $config_error_filename; ?>" />
                <?php if ($error_error_filename) { ?>
                <span class="error"><?php echo $error_error_filename; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_google_analytics; ?></td>
              <td><textarea name="config_google_analytics" cols="40" rows="5"><?php echo $config_google_analytics; ?></textarea></td>
            </tr>
          </table>
        </div>

				<!--
				/**
					*Ajax advanced search starts
					*/
				-->	
				<div class="tab-pane" id="tab-ajaxadvancedsearch">
					<div class="tab-content">
						<div class="tab-pane">
							<?php $chk = 'checked="checked"';?>
							<!-- 26-01-2014 starts -->
							<style>
								.colorpickers {margin-top:10px; display: flex; }
								table.colorform > tbody > tr > td:first-child { width: auto; }
								.preview { width: 60px; height: 15px; background: #fff; border: 1px solid #dddddd; padding: 3px; margin-top:10px; display:inline-block; }
							</style>
							<!-- 26-01-2014 ends -->
							<ul id="ajaxadvancedsearchtabs" class="htabs">
								<a href="#tab-ajaxadvancedsearchgeneral"><?php echo $tab_ajaxadvancedsearchgeneral; ?></a>
								<a href="#tab-ajaxadvancedsearchsearch"><?php echo $tab_ajaxadvancedsearchsearch; ?></a>
								<a href="#tab-ajaxadvancedsearchshow"><?php echo $tab_ajaxadvancedsearchshow; ?></a>
								<a href="#tab-ajaxadvancedsearchcolors"><?php echo $tab_ajaxadvancedsearchcolors; ?></a>
							</ul>
							<?php $chk = 'checked="checked"';?>
							<div class="tab-content">
								<div id="tab-ajaxadvancedsearchgeneral">
									<table class="form">
									<tr>
										<td><?php echo $text_ajaxadvancedsearch; ?></td>
										<td><label for="ajaxadvancedsearch-status1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch" value="1" <?php if($config_ajaxadvancedsearch==1){echo $chk;}?> /> <?php echo $text_enabled; ?></label><label for="ajaxadvancedsearch-status0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch" value="0" <?php if($config_ajaxadvancedsearch==0 || !$config_ajaxadvancedsearch){echo $chk;}?> /> <?php echo $text_disabled; ?></label></td>
									</tr>
									<tr>
										<td><?php echo $text_ajaxadvancedsearch_limit; ?><?php echo $help_ajaxadvancedsearch_limit; ?></td>
										<td><input type="text" class="" name="config_ajaxadvancedsearch_limit" value="<?php echo $config_ajaxadvancedsearch_limit; ?>" /> </td>
									</tr>
									<!-- 26-01-2014 starts -->
									<tr class="form-group">
										<td><?php echo $text_ajaxadvancedsearch_charlimit; ?><?php echo $help_ajaxadvancedsearch_charlimit; ?></td>
										<td><input type="text" class="" name="config_ajaxadvancedsearch_charlimit" value="<?php echo $config_ajaxadvancedsearch_charlimit; ?>" /> </td>
									</tr>
									<!-- 26-01-2014 ends -->
									<tr class="form-group">
										<td><?php echo $text_display_image; ?></td>
										<td><label for="ajaxadvancedsearch-display-image1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_image" value="1" <?php if($config_ajaxadvancedsearch_image==1){echo $chk;}?> /> <?php echo $text_yes; ?></label><label for="ajaxadvancedsearch-display-image0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_image" value="0" <?php if($config_ajaxadvancedsearch_image==0 || !$config_ajaxadvancedsearch_image){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
									</tr>
									<tr>
										<td><span class="required"> * </span><?php echo $text_imagesize; ?><?php echo $help_imagesize; ?></td>
										<td><?php echo $text_imagewidth; ?><input type="text" class="" name="config_ajaxadvancedsearch_image_width" value="<?php echo $config_ajaxadvancedsearch_image_width; ?>" placeholder="<?php echo $text_imagewidth; ?>" /><?php echo $text_imageheight; ?><input type="text" class="" name="config_ajaxadvancedsearch_image_height" value="<?php echo $config_ajaxadvancedsearch_image_height; ?>" placeholder="<?php echo $text_imageheight; ?>" />
										<?php if ($error_config_ajaxadvancedsearch_image) { ?>
											<span class="error"><?php echo $error_config_ajaxadvancedsearch_image; ?></span>
										<?php } ?>
										</td>
									</tr>
									<!-- 26-01-2014 starts -->
									<tr>
										<td><?php echo $text_result_view; ?></td>
										<td><label for="ajaxadvancedsearch-dsplay-query1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_result_view" value="border-bottom" <?php if($config_ajaxadvancedsearch_result_view=='border-bottom' ){echo $chk;}?> /><?php echo $text_result_viewbottom; ?></label><label for="ajaxadvancedsearch-dsplay-query0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_result_view" value="default-view" <?php if($config_ajaxadvancedsearch_result_view=='default-view' || empty($config_ajaxadvancedsearch_result_view)){echo $chk;}?> /> <?php echo $text_result_viewborder; ?></label><br/><img class="img-thumbnail" id="ajaxadvancedsearchtemplate" alt="" src=""></td>
									</tr>
									<!-- 26-01-2014 starts -->
									<tr>
										<td><?php echo $text_colorhighlight; ?><?php echo $help_colorpicker; ?></td>
										<td>									
											<table class="form colorform">
												<tbody>
												<tr>											
													<td><?php echo $text_colorhighlight; ?><br/><input size="60" type="text" class="colorpickers " name="config_ajaxadvancedsearch_color_highlight" value="<?php echo $config_ajaxadvancedsearch_color_highlight; ?>" placeholder="<?php echo $text_colorhighlight; ?>" /><div class="preview"></div></td>
													<td><?php echo $text_colorhighlighthover; ?><br/><input size="60" type="text" class="colorpickers " name="config_ajaxadvancedsearch_color_highlighthover" value="<?php echo $config_ajaxadvancedsearch_color_highlighthover; ?>" placeholder="<?php echo $text_colorhighlighthover; ?>" /><div class="preview"></div></td>
												</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<!-- 26-01-2014 ends -->
									<tr>
										<td><?php echo $text_highlight; ?></td>
										<td><label for="ajaxadvancedsearch-highlight-sepeate" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_highlight" value="1" <?php if($config_ajaxadvancedsearch_highlight==1){echo $chk;}?> /><?php echo $text_highlight_sepeate; ?></label><label for="ajaxadvancedsearch-highlight-combine" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_highlight" value="2" <?php if($config_ajaxadvancedsearch_highlight==2){echo $chk;}?> /><?php echo $text_highlight_combine; ?></label><label for="ajaxadvancedsearch-highlight-no" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_highlight" value="0" <?php if($config_ajaxadvancedsearch_highlight==0 || !$config_ajaxadvancedsearch_highlight){echo $chk;}?> /><?php echo $text_highlight_no; ?></label></td>
									</tr>
								</table>
								</div> <!-- // tab-ajaxadvancedsearchgeneral end // -->
								<div class="tab-pane" id="tab-ajaxadvancedsearchcolors">
									<table class="form">
										<tbody>
										<tr class="form-group">
											<td><?php echo $text_colorenabletall; ?><?php echo $help_colorenableall; ?></td>
											<td class="col-sm-10"><label for="ajaxadvancedsearch-colorenableall1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_colorenabletall" value="1" <?php if($config_ajaxadvancedsearch_colorenabletall==1){echo $chk;}?> /><?php echo $text_enabled; ?></label><label for="ajaxadvancedsearch-colorenableall0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_colorenabletall" value="0" <?php if($config_ajaxadvancedsearch_colorenabletall==0 || !$config_ajaxadvancedsearch_colorenabletall){echo $chk;}?> /> <?php echo $text_disabled; ?></label></td>
										</tr>
										<tr class="form-group">
											<td><?php echo $text_colordefaultall; ?><?php echo $help_colordefaultall; ?></td>
											<td class="col-sm-10"><label for="ajaxadvancedsearch-colordefaultall1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_colordefaultall" value="1" <?php if($config_ajaxadvancedsearch_colordefaultall==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label for="ajaxadvancedsearch-colordefaultall0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_colordefaultall" value="0" <?php if($config_ajaxadvancedsearch_colordefaultall==0 || !$config_ajaxadvancedsearch_colordefaultall){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
										</tr>
										<tr class="form-group">
											<td><?php echo $text_colordefaultall; ?><?php echo $help_colorpicker; ?></td>
											<td>
												<table class="form colorform">
													<tbody>
													<tr>
														<td><?php echo $text_colordefault; ?><br/><input size="60" type="text" class="colorpickers" name="config_ajaxadvancedsearch_color_default" value="<?php echo $config_ajaxadvancedsearch_color_default; ?>" placeholder="<?php echo $text_colordefault; ?>" /><div class="preview"></div></td>
														<td><?php echo $text_colordefaulthover; ?><br/><input size="60" type="text" class="colorpickers" name="config_ajaxadvancedsearch_color_defaulthover" value="<?php echo $config_ajaxadvancedsearch_color_defaulthover; ?>" placeholder="<?php echo $text_colordefaulthover; ?>" /><div class="preview"></div></td>						
													</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr class="form-group">
											<td><?php echo $text_colorheading; ?><?php echo $help_colorpicker; ?></td>
											<td>
												<table class="form colorform">
													<tbody>
													<tr>
														<td><?php echo $text_colorheading; ?><br/><input size="60" type="text" class="colorpickers" name="config_ajaxadvancedsearch_color_heading" value="<?php echo $config_ajaxadvancedsearch_color_heading; ?>" placeholder="<?php echo $text_colorheading; ?>" /><div class="preview"></div></td>
														<td class="col-sm-6 row"><?php echo $text_colorheadinghover; ?><br/><input size="60" type="text" class="colorpickers" name="config_ajaxadvancedsearch_color_headinghover" value="<?php echo $config_ajaxadvancedsearch_color_headinghover; ?>" placeholder="<?php echo $text_colorheadinghover; ?>" /><div class="preview"></div></td>
													</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<td><?php echo $text_colormodel; ?><?php echo $help_colorpicker; ?></td>
											<td>
												<table class="form colorform">
													<tbody>
													<tr>
														<td><?php echo $text_colormodel; ?><br/><input size="60" type="text" class="colorpickers" name="config_ajaxadvancedsearch_color_model" value="<?php echo $config_ajaxadvancedsearch_color_model; ?>" placeholder="<?php echo $text_colormodel; ?>" /><div class="preview"></div></td>
														<td class="col-sm-6 row"><?php echo $text_colormodelhover; ?><br/><input size="60" type="text" class="colorpickers" name="config_ajaxadvancedsearch_color_modelhover" value="<?php echo $config_ajaxadvancedsearch_color_modelhover; ?>" placeholder="<?php echo $text_colormodelhover; ?>" /><div class="preview"></div></td>
													</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<td><?php echo $text_colormanufacturer; ?><?php echo $help_colorpicker; ?></td>
											<td>
												<table class="form colorform">
													<tbody>
													<tr>
														<td><?php echo $text_colormanufacturer; ?><br/><input size="60" type="text" class="colorpickers" name="config_ajaxadvancedsearch_color_manufacturer" value="<?php echo $config_ajaxadvancedsearch_color_manufacturer; ?>" placeholder="<?php echo $text_colormanufacturer; ?>" /><div class="preview"></div></td>
														<td><?php echo $text_colormanufacturerhover; ?><br/><input size="60" type="text" class="colorpickers" name="config_ajaxadvancedsearch_color_manufacturerhover" value="<?php echo $config_ajaxadvancedsearch_color_manufacturerhover; ?>" placeholder="<?php echo $text_colormanufacturerhover; ?>" /><div class="preview"></div></td>
													</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<td><?php echo $text_colorprice; ?><?php echo $help_colorpicker; ?></td>
											<td class="col-sm-10">
												<table class="form colorform">
													<tbody>
													<tr>
														<td><?php echo $text_colorprice; ?><br/><input size="60" type="text" class="colorpickers" name="config_ajaxadvancedsearch_color_price" value="<?php echo $config_ajaxadvancedsearch_color_price; ?>" placeholder="<?php echo $text_colorprice; ?>" /><div class="preview"></div></td>
														<td class="col-sm-6 row"><?php echo $text_colorpricehover; ?><br/><input size="60" type="text" class="colorpickers" name="config_ajaxadvancedsearch_color_pricehover" value="<?php echo $config_ajaxadvancedsearch_color_pricehover; ?>" placeholder="<?php echo $text_colorpricehover; ?>" /><div class="preview"></div></td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<td><?php echo $text_colorstockstatus; ?><?php echo $help_colorpicker; ?></td>
											<td>
												<table class="form colorform">
													<tbody>
													<tr>
														<td><?php echo $text_colorstockstatus; ?><br/><input size="60" type="text" class="colorpickers" name="config_ajaxadvancedsearch_color_stockstatus" value="<?php echo $config_ajaxadvancedsearch_color_stockstatus; ?>" placeholder="<?php echo $text_colorstockstatus; ?>" /><div class="preview"></div></td>
														<td class="col-sm-6 row"><?php echo $text_colorstockstatushover; ?><br/><input size="60" type="text" class="colorpickers" name="config_ajaxadvancedsearch_color_stockstatushover" value="<?php echo $config_ajaxadvancedsearch_color_stockstatushover; ?>" placeholder="<?php echo $text_colorstockstatushover; ?>" /><div class="preview"></div></td>
													</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr class="form-group">
											<td><?php echo $text_colorquantity; ?><?php echo $help_colorpicker; ?></td>
											<td>
												<table class="form colorform">
													<tbody>
													<tr>
														<td><?php echo $text_colorquantity; ?><br/><input size="60" type="text" class="colorpickers" name="config_ajaxadvancedsearch_color_quantity" value="<?php echo $config_ajaxadvancedsearch_color_quantity; ?>" placeholder="<?php echo $text_colorquantity; ?>" /><div class="preview"></div></td>							
														<td><?php echo $text_colorquantityhover; ?><br/><input size="60" type="text" class="colorpickers" name="config_ajaxadvancedsearch_color_quantityhover" value="<?php echo $config_ajaxadvancedsearch_color_quantityhover; ?>" placeholder="<?php echo $text_colorquantityhover; ?>" /><div class="preview"></div></td>
													</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<td><?php echo $text_colorresult; ?><?php echo $help_colorpicker; ?></td>
											<td>
												<table class="form colorform">
													<tbody>
													<tr>
														<td><?php echo $text_colorresulteven; ?><br/><input size="60" type="text" class="colorpickers" name="config_ajaxadvancedsearch_color_evenresult" value="<?php echo $config_ajaxadvancedsearch_color_evenresult; ?>" placeholder="<?php echo $text_colorresulteven; ?>" /><div class="preview"></div></td>						
														<td class="col-sm-6 row"><?php echo $text_colorresultodd; ?><br/><input size="60" type="text" class="colorpickers" name="config_ajaxadvancedsearch_color_oddresult" value="<?php echo $config_ajaxadvancedsearch_color_oddresult; ?>" placeholder="<?php echo $text_colorresultodd; ?>" /><div class="preview"></div></td>
													</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<td><?php echo $text_colorresulthover; ?><?php echo $help_colorpicker; ?></td>
											<td><input size="60" type="text" class="colorpickers" name="config_ajaxadvancedsearch_color_resulthover" value="<?php echo $config_ajaxadvancedsearch_color_resulthover; ?>" placeholder="<?php echo $text_colorresulthover; ?>" /><div class="preview"></div></td>
										</tr>
										</tbody>
									</table>
								</div> <!-- // tab-ajaxadvancedsearchcolors end // -->

								<!-- 26-01-2014 ends -->
								<div class="tab-pane" id="tab-ajaxadvancedsearchshow">
									<table class="form">
										<tbody>
										<!-- 26-01-2014 starts -->
										<tr>
											<td><?php echo $text_display_query; ?><?php echo $help_display_query; ?></td>
											<td><label for="ajaxadvancedsearch-dsplay-query1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_displayallresults" value="1" <?php if($config_ajaxadvancedsearch_displayallresults==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label for="ajaxadvancedsearch-dsplay-query0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_displayallresults" value="0" <?php if($config_ajaxadvancedsearch_displayallresults==0 || !$config_ajaxadvancedsearch_displayallresults){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
										</tr>
										<!-- 26-01-2014 ends -->
										<tr>
											<td><?php echo $text_display_model; ?></td>
											<td><label for="ajaxadvancedsearch-display-model1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_model" value="1" <?php if($config_ajaxadvancedsearch_model==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label for="ajaxadvancedsearch-display-model0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_model" value="0" <?php if($config_ajaxadvancedsearch_model==0 || !$config_ajaxadvancedsearch_model){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
										</tr>
										<tr class="form-group">
											<td><?php echo $text_display_manufacturer; ?></td>
											<td><label for="ajaxadvancedsearch-display-manufacturer1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_manufacturer" value="1" <?php if($config_ajaxadvancedsearch_manufacturer==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label for="ajaxadvancedsearch-display-manufacturer0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_manufacturer" value="0" <?php if($config_ajaxadvancedsearch_manufacturer==0 || !$config_ajaxadvancedsearch_manufacturer){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
										</tr>
										<tr>
											<td><?php echo $text_display_price; ?></td>
											<td><label for="ajaxadvancedsearch-display-price1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_price" value="1" <?php if($config_ajaxadvancedsearch_price==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label for="ajaxadvancedsearch-display-price0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_price" value="0" <?php if($config_ajaxadvancedsearch_price==0 || !$config_ajaxadvancedsearch_price){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
										</tr>										
										<!--/**Customer group price show starts*/-->
										<tr>
											<td><?php echo $text_login_display_price; ?><?php echo $help_login_display_price; ?></td>
											<td><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_pricelogin" value="1" <?php if($config_ajaxadvancedsearch_pricelogin==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_pricelogin" value="0" <?php if($config_ajaxadvancedsearch_pricelogin==0 || !$config_ajaxadvancedsearch_pricelogin){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
										</tr>							
										<tr>
											<td><?php echo $text_display_price_customergroups; ?><?php echo $help_display_price_customergroups; ?></td>
											<td>
												<div class="scrollbox">
													<?php $class = 'odd'; ?>
													<?php foreach($ajaxadvance_customergroups as $ajaxadvance_customergroup) {
													$chk1='';
													if(in_array($ajaxadvance_customergroup['customer_group_id'],$config_ajaxadvancedsearch_customergroups)){
														$chk1='checked="checked"';
													}
													?>
													<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
													<div id="group-<?php echo $ajaxadvance_customergroup['customer_group_id']; ?>" class="<?php echo $class; ?>">
													<label><input <?php echo $chk1; ?> type="checkbox" name="config_ajaxadvancedsearch_customergroups[]" value="<?php echo $ajaxadvance_customergroup['customer_group_id']; ?>">
													<?php echo $ajaxadvance_customergroup['name']; ?></label>
													</div>
													<?php } ?>
												</div>
											</td>
										</tr>
										<!--/**Customer group price show ends*/-->										
										<tr>
											<td><?php echo $text_display_rating; ?></td>
											<td><label for="ajaxadvancedsearch-display-rating1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_rating" value="1" <?php if($config_ajaxadvancedsearch_rating==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label for="ajaxadvancedsearch-display-rating0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_rating" value="0" <?php if($config_ajaxadvancedsearch_rating==0 || !$config_ajaxadvancedsearch_rating){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
										</tr>
										<tr>
											<td><?php echo $text_display_stock; ?></td>
											<td><label for="ajaxadvancedsearch-display-stock1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_stock" value="1" <?php if($config_ajaxadvancedsearch_stock==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label for="ajaxadvancedsearch-display-stock0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_stock" value="0" <?php if($config_ajaxadvancedsearch_stock==0 || !$config_ajaxadvancedsearch_stock){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
										</tr>
										<!-- 26-01-2014 starts -->
										<tr class="form-group">
											<td><?php echo $text_display_quantity; ?></td>
											<td><label for="ajaxadvancedsearch-display-quantity1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_quantity" value="1" <?php if($config_ajaxadvancedsearch_quantity==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label for="ajaxadvancedsearch-display-quantity0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_quantity" value="0" <?php if($config_ajaxadvancedsearch_quantity==0 || !$config_ajaxadvancedsearch_quantity){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
										</tr>
										<!-- 26-01-2014 ends -->
										</tbody>
									</table>
								</div> <!-- // tab-ajaxadvancedsearchshow end // -->
								<div class="tab-pane" id="tab-ajaxadvancedsearchsearch">
									<table class="form">
										<tbody>
										<tr>
											<td><?php echo $text_search_model; ?></td>
											<td><label for="ajaxadvancedsearch-search-model1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_model_search" value="1" <?php if($config_ajaxadvancedsearch_model_search==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label for="ajaxadvancedsearch-search-model0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_model_search" value="0" <?php if($config_ajaxadvancedsearch_model_search==0 || !$config_ajaxadvancedsearch_model_search){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
										</tr>
										<tr class="form-group">
											<td><?php echo $text_search_tag; ?></td>
											<td><label for="ajaxadvancedsearch-search-tag1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_tag" value="1" <?php if($config_ajaxadvancedsearch_tag==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label for="ajaxadvancedsearch-search-tag0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_tag" value="0" <?php if($config_ajaxadvancedsearch_tag==0 || !$config_ajaxadvancedsearch_tag){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
										</tr>
										<tr>
											<td><?php echo $text_search_mpn; ?></td>
											<td><label for="ajaxadvancedsearch-searh-mpn1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_mpn" value="1" <?php if($config_ajaxadvancedsearch_mpn==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label for="ajaxadvancedsearch-searh-mpn0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_mpn" value="0" <?php if($config_ajaxadvancedsearch_mpn==0 || !$config_ajaxadvancedsearch_mpn){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
										</tr>
										<tr>
											<td><?php echo $text_search_manufacturer; ?></td>
											<td><label for="ajaxadvancedsearch-searh-manufacturer1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_manufacturer_search" value="1" <?php if($config_ajaxadvancedsearch_manufacturer_search==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label for="ajaxadvancedsearch-searh-manufacturer0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_manufacturer_search" value="0" <?php if($config_ajaxadvancedsearch_manufacturer_search==0 || !$config_ajaxadvancedsearch_manufacturer_search){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
										</tr>
										<tr>
											<td><?php echo $text_search_isbn; ?></td>
											<td><label for="ajaxadvancedsearch-search-isbn1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_isbn" value="1" <?php if($config_ajaxadvancedsearch_isbn==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label for="ajaxadvancedsearch-search-isbn0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_isbn" value="0" <?php if($config_ajaxadvancedsearch_isbn==0 || !$config_ajaxadvancedsearch_isbn){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
										</tr>
										<tr>
											<td><?php echo $text_search_jan; ?></td>
											<td><label for="ajaxadvancedsearch-search-jan1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_jan" value="1" <?php if($config_ajaxadvancedsearch_jan==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label for="ajaxadvancedsearch-search-jan0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_jan" value="0" <?php if($config_ajaxadvancedsearch_jan==0 || !$config_ajaxadvancedsearch_jan){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
										</tr>
										<tr>
											<td><?php echo $text_search_ean; ?></td>
											<td><label for="ajaxadvancedsearch-search-ean1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_ean" value="1" <?php if($config_ajaxadvancedsearch_ean==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label for="ajaxadvancedsearch-search-ean0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_ean" value="0" <?php if($config_ajaxadvancedsearch_ean==0 || !$config_ajaxadvancedsearch_ean){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
										</tr>
										<tr>
											<td><?php echo $text_search_upc; ?></td>
											<td><label for="ajaxadvancedsearch-search-upc1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_upc" value="1" <?php if($config_ajaxadvancedsearch_upc==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label for="ajaxadvancedsearch-search-upc0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_upc" value="0" <?php if($config_ajaxadvancedsearch_upc==0 || !$config_ajaxadvancedsearch_upc){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
										</tr>
										<tr>
											<td><?php echo $text_search_sku; ?></td>
											<td><label for="ajaxadvancedsearch-search-sku1" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_sku" value="1" <?php if($config_ajaxadvancedsearch_sku==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label for="ajaxadvancedsearch-search-sku0" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_sku" value="0" <?php if($config_ajaxadvancedsearch_sku==0 || !$config_ajaxadvancedsearch_sku){echo $chk;}?> /> <?php echo $text_no; ?></label></td>
										</tr>
										</tbody>
									</table>
								</div> <!-- // tab-ajaxadvancedsearchsearch end // -->
							</div> <!-- // tab-content end // -->
						</div>
					</div>
				</div>	
				<!--
				/**
					*Ajax advanced search ends
					*/
				-->	
			
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#template').load('index.php?route=setting/setting/template&token=<?php echo $token; ?>&template=' + encodeURIComponent($('select[name=\'config_template\']').attr('value')));
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'config_country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=setting/setting/country&token=<?php echo $token; ?>&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="view/image/loading.gif" alt="" /></span>');
		},		
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $config_zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'config_zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'config_country_id\']').trigger('change');
//--></script> 
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 

				<!--
				/**
					*Ajax advanced search starts
					*/
				-->
				<!--26-01-2014 starts-->
				<script type="text/javascript"><!--
				$(document).ready(function(){
					var ajaxadvancedsearch_currentcol = null;
					$('.colorpickers').ColorPicker({
						curr : '',
						onShow: function (colpkr) {
							$(colpkr).fadeIn(500);
							return false;
						},
						onHide: function (colpkr) {
							$(colpkr).fadeOut(500);
							return false;
						},
						onSubmit: function(hsb, hex, rgb, el) {
							$(el).val(hex);
							$(el).ColorPickerHide();
						},
						onBeforeShow: function () {
							$(this).ColorPickerSetColor(this.value);
						},onChange: function (hsb, hex, rgb) {
							ajaxadvancedsearch_currentcol.curr.next('.preview').css('background', '#' + hex);
							ajaxadvancedsearch_currentcol.curr.val(hex);
						}
					})
					.bind('keyup', function(){
						$(this).ColorPickerSetColor(this.value);
					}).click(function(){
						ajaxadvancedsearch_currentcol = this;
						ajaxadvancedsearch_currentcol.curr = $(this);
					});

					$.each($('.colorpickers'),function(key,value){
						$(this).next('.preview').css({'background':'#'+$(this).val()});
					});

					$('input[name=\'config_ajaxadvancedsearch_result_view\']').on('click', function() {
						$.ajax({
							url: 'index.php?route=setting/setting/ajaxadvancedsearchtemplate&token=<?php echo $token; ?>&template=' + encodeURIComponent(this.value),
							dataType: 'html',
							beforeSend: function() {
							},
							complete: function() {
							},
							success: function(html) {
								$('#ajaxadvancedsearchtemplate').attr('src', html);
							},
							error: function(xhr, ajaxOptions, thrownError) {
								alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
							}
						});
					});

					$('input[name=\'config_ajaxadvancedsearch_result_view\']:checked').trigger('click');
				});
				//--></script>
				<script type="text/javascript"><!--
				$('#ajaxadvancedsearchtabs a').tabs();
				//--></script> 
				<!--26-01-2014 ends-->
				<!--
				/**
					*Ajax advanced search ends
					*/
				-->
			
<?php echo $footer; ?>
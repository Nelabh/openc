<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body>
<div id="container">
<div id="header">
  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
  <?php } ?>
  <?php echo $language; ?>
  <?php echo $currency; ?>
  <?php echo $cart; ?>
  <div id="search">
    <div class="button-search"></div>
    <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
  </div>
  <div id="welcome">
    <?php if (!$logged) { ?>
    <?php echo $text_welcome; ?>
    <?php } else { ?>
    <?php echo $text_logged; ?>
    <?php } ?>
  </div>
  <div class="links"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div>
</div>
<?php if ($categories) { ?>
<div id="menu">
  <ul>
    <?php foreach ($categories as $category) { ?>
    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
</div>
<?php } ?>

				<?php if($ajaxadvancesearch_status){ ?>
				<!--
				/**
					*Ajax advanced search starts
					*/
				-->
				<script type="text/javascript" language="javascript"><!--
					// Ajax advanced search starts
					$(document).ready(function(){
						var allRequest = null;
						var afaxAdvancedSearch = $('#search input[name="search"]');
						afaxAdvancedSearch.autocomplete({
							delay: 500,
							source: function(request, response) {
								if(request.term.trim().length >= <?php echo $ajaxadvancesearch_charlimit ?>) {
								allRequest = request;
									$.ajax({
										url: 'index.php?route=common/header/ajaxLiveSearch&filter_name=' +  encodeURIComponent(request.term.split('')),
										dataType: 'json',
										success: function(json) {
											response($.map(json, function(item) {
												return {
													label: item.name,
													name: item.name1,
													value: item.product_id,
													model: item.model,
													stock_status: item.stock_status,
													/** 26-01-2015 starts */
													quantity: item.quantity,
													/** 26-01-2015 ends */
													// seo friendly starts
													url: item.url,
													// seo friendly ends
													image: item.image,
													manufacturer: item.manufacturer,
													price: item.price,
													special: item.special,
													category: item.category,
													rating: item.rating,
													allresults: item.allresults,
													reviews: item.reviews,
												}
											}));
										}
									});
								}	
							}, 
							select: function(event, ui) {								
								if(ui.item.value!=0){
									//location = 'index.php?route=product/product/&product_id='+ui.item.value;
									location = ui.item.url.replace('&amp;','&');
								}else{
									$('.button-search').trigger('click');
								}
								return false;
							},
							focus: function(event, ui) {
								return false;
							},							
						}).data("autocomplete")._renderItem = function(ul, item){
								var html = '<div class="ajaxadvance" id="ajaxadvance'+item.value+'">';
										html += '<div class="image">';
										if(item.image){
										html += '<img title="'+item.name+'" src="'+item.image+'"/>';
										}
										html += '</div>';
										html += '<div class="content">';
										html += 	'<h3 class="name">'+item.label+'</h3>';
										if(item.model){
										html += 	'<div class="model">';
										html +=		'<?php echo $ajaxadvancedsearch_model; ?> '+ item.model;
										html +=		'</div>';
										}
										if(item.manufacturer){
										html += 	'<div class="manufacturer">';
										html +=		'<?php echo $ajaxadvancedsearch_manufacturer; ?> '+ item.manufacturer;			
										html +=		'</div>';		
										}
										if(item.price){
										html += 	'<div class="price"> <?php echo $ajaxadvancedsearch_price; ?> ';
											if (!item.special) { 
										html +=			 item.price;
											} else {	
										html +=			'<span class="price-old">'+ item.price +'</span> <span class="price-new">'+ item.special +'</span>';
											}	
										html +=		'</div>';
										}
										if(item.stock_status){
										html += 	'<div class="stock_status">';
										html +=		'<?php echo $ajaxadvancedsearch_stock; ?> '+ item.stock_status;			
										html +=		'</div>';
										}
										if(item.quantity){
										html += 	'<div class="quantity">';
										html +=		'<?php echo $ajaxadvancedsearch_quantity; ?> '+ item.quantity;
										html +=		'</div>';
										}
										if (item.rating) {
										html +=		'<div class="rating"> <?php echo $ajaxadvancedsearch_rating; ?> <img src="catalog/view/theme/default/image/stars-'+ item.rating+ '.png" alt="'+ item. reviews +'" /></div>';
										}										
										if (item.allresults) {
										html +=		'<div class="allresults">'+allRequest.term.trim()+'</div>';
										}
										html +='</div>';
								html += '</div>';
								return $('<li></li>')
									 .data('item.autocomplete', item)
									 .append('<a>' + html + '</a>')
									 .appendTo(ul);
						};
					});
					//Ajax advanced search ends
				//--></script>
				<style>
				.ui-menu {z-index: 666 !important; background: #fff;}
				.ui-menu li:nth-child(even){background: #FFFFFF;  border: 1px solid #dbdee1;}
				.ui-menu li:nth-child(odd){background: #E4EEF7;  border: 1px solid #fff;}
				.ui-menu li, .ui-menu .ui-menu-item { margin-bottom: 10px;}
				.ui-menu a {border-radius: 0 ;}
				.ui-menu li:nth-child(even){background: #<?php echo !empty($ajaxadvancedsearch_color_evenresult) ? $ajaxadvancedsearch_color_evenresult : 'FFFFFF';?>;  border: 1px solid #dbdee1;}
				.ui-menu li:nth-child(odd){background: #<?php echo !empty($ajaxadvancedsearch_color_oddresult) ? $ajaxadvancedsearch_color_oddresult : 'E4EEF7'; ?>;  border: 1px solid #fff;}
				/*<!-- 26-01-2014 starts -->*/
				<?php if($ajaxadvancedsearch_result_view!='default-view') { ?>
					.ui-menu li:nth-child(even){background: #<?php echo !empty($ajaxadvancedsearch_color_evenresult) ? $ajaxadvancedsearch_color_evenresult : 'FFFFFF';?>;  border: none; padding: 1px; /*padding:0 10px;*/ }
					.ui-menu li:nth-child(odd){background: #<?php echo !empty($ajaxadvancedsearch_color_oddresult) ? $ajaxadvancedsearch_color_oddresult : 'FFFFFF'; ?>;  border: none; padding: 1px; /*padding:0 10px;*/ }
					/**1.5.6 changes starts*/
					.ui-menu .ui-menu-item a{ border: none; }
					.ui-state-hover, .ui-widget-content .ui-state-hover, .ui-widget-header .ui-state-hover, .ui-state-focus, .ui-widget-content .ui-state-focus, .ui-widget-header .ui-state-focus { background: none;}
					.ui-menu .ui-menu-item a.ui-state-hover,.ui-menu .ui-menu-item a.ui-state-active{ margin:0; }
					 /**1.5.6 changes ends*/
					.ui-menu .ui-menu-item a { border-bottom: 1px solid #cdcece; border-radius: 0; white-space: normal; }
					.ui-menu li:last-child a { border-bottom: none; }
					 
				<?php } ?>
				/** result area hover starts */
				<?php if(!empty($ajaxadvancedsearch_color_resulthover)) { ?>
				.ui-menu > li > a:hover, .ui-menu li:hover {
					background: #<?php echo $ajaxadvancedsearch_color_resulthover; ?>;
				}
				<?php } ?>
				/** result area hover ends */
				/** result area heading starts */
				<?php if(!empty($ajaxadvancedsearch_color_heading)) { ?>
				/** for heading color */
				.ui-menu li a .ajaxadvance h3,
				.ui-menu li a .ajaxadvance h4
				{ color: #<?php echo $ajaxadvancedsearch_color_heading; ?>; }
				<?php } ?>
				<?php if(!empty($ajaxadvancedsearch_color_headinghover)) { ?>
				/**for heading color on hover*/
				.ui-menu li a:hover .ajaxadvance h3,
				.ui-menu li a:hover .ajaxadvance h4
				{ color: #<?php echo $ajaxadvancedsearch_color_headinghover; ?>; }
				<?php } ?>
				/** result area heading ends */
				/** result area model starts */
				<?php if(!empty($ajaxadvancedsearch_color_model)) { ?>
				/** for model color */
				.ui-menu li a .ajaxadvance .model,
				.ui-menu li a .ajaxadvance .model
				{ color: #<?php echo $ajaxadvancedsearch_color_model; ?>; }
				<?php } ?>
				<?php if(!empty($ajaxadvancedsearch_color_modelhover)) { ?>
				/**for model color on hover*/
				.ui-menu li a:hover .ajaxadvance .model,
				.ui-menu li a:hover .ajaxadvance .model
				{ color: #<?php echo $ajaxadvancedsearch_color_modelhover; ?>; }
				<?php } ?>
				/** result area model ends */
				/** result area manufacturer starts */
				<?php if(!empty($ajaxadvancedsearch_color_manufacturer)) { ?>
				/** for manufacturer color */
				.ui-menu li a .ajaxadvance .manufacturer,
				.ui-menu li a .ajaxadvance .manufacturer
				{ color: #<?php echo $ajaxadvancedsearch_color_manufacturer; ?>; }
				<?php } ?>
				<?php if(!empty($ajaxadvancedsearch_color_manufacturerhover)) { ?>
				/**for manufacturer color on hover*/
				.ui-menu li a:hover .ajaxadvance .manufacturer,
				.ui-menu li a:hover .ajaxadvance .manufacturer
				{ color: #<?php echo $ajaxadvancedsearch_color_manufacturerhover; ?>; }
				<?php } ?>
				/** result area manufacturer ends */
				/** result area price starts */
				<?php if(!empty($ajaxadvancedsearch_color_price)) { ?>
				/** for price color */
				.ui-menu li a .ajaxadvance .price,
				.ui-menu li a .ajaxadvance .price
				{ color: #<?php echo $ajaxadvancedsearch_color_price; ?>; }
				<?php } ?>
				<?php if(!empty($ajaxadvancedsearch_color_pricehover)) { ?>
				/**for price color on hover*/
				.ui-menu li a:hover .ajaxadvance .price,
				.ui-menu li a:hover .ajaxadvance .price
				{ color: #<?php echo $ajaxadvancedsearch_color_pricehover; ?>; }
				<?php } ?>
				/** result area price ends */
				/** result area stockstatus starts */
				<?php if(!empty($ajaxadvancedsearch_color_stockstatus)) { ?>
				/** for stock_status color */
				.ui-menu li a .ajaxadvance .stock_status,
				.ui-menu li a .ajaxadvance .stock_status
				{ color: #<?php echo $ajaxadvancedsearch_color_stockstatus; ?>; }
				<?php } ?>
				<?php if(!empty($ajaxadvancedsearch_color_stockstatushover)) { ?>
				/**for stock_status color on hover*/
				.ui-menu li a:hover .ajaxadvance .stock_status,
				.ui-menu li a:hover .ajaxadvance .stock_status
				{ color: #<?php echo $ajaxadvancedsearch_color_stockstatushover; ?>; }
				<?php } ?>
				/** result area stockstatus ends */
				/** result area quantity starts */
				<?php if(!empty($ajaxadvancedsearch_color_quantity)) { ?>
				/** for quantity color */
				.ui-menu li a .ajaxadvance .quantity,
				.ui-menu li a .ajaxadvance .quantity
				{ color: #<?php echo $ajaxadvancedsearch_color_quantity; ?>; }
				<?php } ?>
				<?php if(!empty($ajaxadvancedsearch_color_quantityhover)) { ?>
				/**for quantity color on hover*/
				.ui-menu li a:hover .ajaxadvance .quantity,
				.ui-menu li a:hover .ajaxadvance .quantity
				{ color: #<?php echo $ajaxadvancedsearch_color_quantityhover; ?>; }
				<?php } ?>
				/** result area quantity ends */
				/** result area highlight starts */
				<?php if(!empty($ajaxadvancedsearch_color_highlight)) { ?>
				/** for highlight color */
				.ui-menu li a .ajaxadvance .highlight,
				.ui-menu li a .ajaxadvance .highlight
				{ color: #<?php echo $ajaxadvancedsearch_color_highlight; ?>; }
				<?php }else{ ?>
				.ui-menu li a .ajaxadvance .highlight {color: #38b0e3; }
				<?php } ?>
				<?php if(!empty($ajaxadvancedsearch_color_highlighthover)) { ?>
				/**for highlight color on hover*/
				.ui-menu li.ui-menu-item a:hover .ajaxadvance .highlight,
				.ui-menu li.ui-menu-item a:hover .ajaxadvance .highlight
				{ color: #<?php echo $ajaxadvancedsearch_color_highlighthover; ?>; }
				<?php }else{ ?>
				.ui-menu li.ui-menu-item a:hover .ajaxadvance .highlight {color: #38b0e3; }
				<?php } ?>
				/** result area highlight ends */

				/*<!-- 26-01-2014 ends -->*/
				.ajaxadvance { display:inline-flex; }
				.ajaxadvance .name { margin:0; }
				.ajaxadvance .image { display:inline-block; float: left;	margin-right:10px; width: <?php echo $ajaxadvancesearch_imagewidth;?>px;}
				.ajaxadvance .content { display:inline-block; max-width: 300px;}
				.ajaxadvance .content > div { margin-top:5px;	}
				.ajaxadvance .price-old {color: #ff0000; text-decoration: line-through; }
				
				</style>
				<!--
				/**
					*Ajax advanced search ends
					*/
				-->
				<?php } ?>
			
<div id="notification"></div>

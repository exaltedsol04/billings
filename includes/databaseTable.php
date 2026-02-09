<?PHP
	define("TABLE_PREFIX", "");
	define("NEW_TABLE_PREFIX", "2026_");
	define("ADMIN_MASTER", TABLE_PREFIX."admins");					
	define("PRODUCTS",  TABLE_PREFIX."products");
	define("PRODUCT_VARIANTS",  TABLE_PREFIX."product_variants");
	define("PRODUCT_IMAGES",  TABLE_PREFIX."product_images");
	define("INVOICE",  TABLE_PREFIX."invoice");
	define("USERS",  TABLE_PREFIX."users");
	define("UNITS",  TABLE_PREFIX."units");
	define("SELLERS",  TABLE_PREFIX."sellers");
	define("POS_ORDERS",  NEW_TABLE_PREFIX."pos_orders");
	define("POS_ORDERS_ITEMS",  NEW_TABLE_PREFIX."pos_order_items");
	define("PRODUCT_STOCK_TRANSACTION",  NEW_TABLE_PREFIX."product_stock_transaction");
	define("VENDORS",  NEW_TABLE_PREFIX."vendors");
	define("ADMIN_STOCK_PURCHASE_LIST",  NEW_TABLE_PREFIX."admin_stock_purchase_list");
	define("CATEGORIES",  TABLE_PREFIX."categories");
	define("ORDERS",  TABLE_PREFIX."orders");
	define("ORDERS_ITEMS",  TABLE_PREFIX."order_items");
	define("ORDERS_STATUSES",  TABLE_PREFIX."order_statuses");
	define("ORDERS_STATUS_LISTS",  TABLE_PREFIX."order_status_lists");
	define("CITIES",  TABLE_PREFIX."cities");
	define("DELIVERY_BOYS",  TABLE_PREFIX."delivery_boys");
	define("PACKAGING_OPERATORS",  NEW_TABLE_PREFIX."packaging_operators");
	define("PACKAGING_OPERATORS_ASSIGN",  NEW_TABLE_PREFIX."packaging_operators_assign");
	define("USER_TOKENS",  TABLE_PREFIX."user_tokens");
	define("SETTINGS",  TABLE_PREFIX."settings");
?>
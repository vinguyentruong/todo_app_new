// ignore_for_file: always_specify_types
// ignore: avoid_classes_with_only_static_members
class ApiEndpoint {
  static const String login = '/login';
  static const String googleLogin = '/googleLogin';
  static const String facebookLogin = '/facebookLogin';
  static const String appleLogin = '/appleLogin';
  static const String forgotPass = '/forgot-pass';
  static const String changePass = '/change-pass';

  static const String userDetails = '/users/me';
  static const String register = '/register';

  static const String stripeProducts = '/stripeProducts';
  static const String photos = '/photos';
  static const String userAvatar = '/users/avatar';
  static const String countries = '/countries';
  static const String cities = '/cities';
  static const String provinces = '/provinces';
  static const String addressSuggestion =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';
  static const String addressDetail = 'https://maps.googleapis.com/maps/api/place/details/json';

  //region Subscriptions
  static const String currentSubscription = '/subscriptions/current';
  static const String subscription = '/subscriptions';
  static const String validateApplePayment = '/subscriptions/validateApplePayment';
  static const String billingHistory = '/stripe-history';
  //endregion

  //#region Business
  static const String setupBusiness = '/businesses/setup';
  static const String checkDomain = '/businesses/checkSlug';
  static const String resendEmail = '/resendEmail';
  static const String getBusiness = '/businesses/show';
  static const String editBusinessSetting = '/businesses/setting';
  static const String editBusiness = '/businesses';
  static const String paymentTypeSetting = '/businesses/setting/payment';
  static const String thirdPartyCredentials = '/businesses/setting/credentials';
  static const String paymentTypeCreditSetting = '/businesses/setting/credit';
  static const String walletInfo = '/businesses/available-payout';
  static const String paymentTransaction = '/payment-transaction';
  static const String language = '/businesses/setting/language';
  //#endregion Business

  //#region Customer
  static const String customers = '/businesses/customers';
  static const String addCustomer = '/businesses/customers/add';

  //#endregion Customer

  //#region Branches
  static const String branches = '/branches';

  //#endregion Branches

  //#region Reservations
  static const String reservations = '/reservations';
  static const String getNewReservations = '/reservations/new';
  static String confirmationReservationStatus(String id) => '/reservations/$id/confirmationStatus';
  //#endregion Reservations

  //#region Tasks
  static const String tasks = '/tasks';
  static const String tasksMonthly = '/tasks/monthly';

  //#endregion Tasks

  //#region Services
  static const String services = '/services';
  static const String getServices = '/services/business';
  static const String syncServices = '/services/business/sync';
  static const String getServiceCategories = '/categories?type=Service';
  static const String syncServiceCategories = '/categories/business/sync?type=Service';

  //#endregion Services

  //#region Products
  static const String products = '/products';
  static const String getProducts = '/products/business';
  static const String syncProducts = '/products/business/sync';
  static const String getProductCategories = '/categories?type=Product';
  static const String syncProductCategories = '/categories/business/sync?type=Product';
  static const String productCategory = '/categories';
  static const String brands = '/brands';
  static const String suppliers = '/suppliers';
  static const String productsBundle = '/product-bundles';
  static const String candidateProducts = '/products/candidates';
  static String productQuantity(String productID) => '/products/$productID/quantity';
  static String productVariantQuantity(String productID, String variantID) =>
      '/products/$productID/variants/$variantID/quantity';
  static String getProduct(String id) => '/products/$id';
  static const String importProducts = '/products/import';

  //#endregion Products

  //#region Employees
  static const String shifts = '/shifts';
  static const String copyShift = '/shifts/copy';
  static const String members = '/employees';
  static const String changeMembersStatus = '/employees/changestatus';

  //#endregion Employees

  //#region Invoices
  static const String invoices = '/invoices';

  static String sendInvoice(String id) => '/invoices/$id/send';
  static const String markAsPaidInvoice = '/invoices/markAsPaid';

  static String downloadInvoice(String id) => '/invoices/$id/download';
  static String genNextInvoiceNumber = '/invoices/genNextInvoiceNumber';

  //#endregion Invoices

  //#region Order

  static const String getPosOrders = '/orders';

  static String getOrder(String id) => '/orders/$id';

  static const String getOnlineOrders = '/orders/market';

  static String updateOrderStatus(String id) => '/orders/$id/market/status';

  static String checkoutOrder(String id) => '/orders/$id/checkout';

  static String archiveOrder(String id) => '/orders/$id/archive';
  static const String calculateOrder = '/orders/calculate';

  static String updateOnlineOrder(String id) => '/orders/$id/online';

  static String trackingOrder(String id) => '/orders/$id/shipmates/tracking-shipment';
  //#endregion Online Order

  //#region expenses
  static const String getExpenses = '/expenses/byMonth';
  static const String getExpenseSale = '/expenses/category-sales/byMonth';
  static const String getExpenseCategories = '/expense-category/business/sync';
  static String expenseCategories([String id = '']) => '/expense-category/$id';

  static String expense([String id = '']) => '/expenses/$id';
  static const String addExpense = '/expenses';

  //#endregion expenses

  //#region roles
  static const String roles = '/template-roles';

  //#endregion roles

  //#region activities
  static String getOrderMessages(String orderId) => '/orders/$orderId/market/activities';
  static String getTaskMessages(String taskId) => '/reservations/$taskId/activities';
  static String getConversationMessages(String conversationId) =>
      '/conversations/$conversationId/messages';
  static String conversations = '/conversations';
  //#endregion activities

  //#region report
  static const String getReportSummary = '/businesses/reports/summary';
  static const String getReportSalesSummary = '/businesses/reports/sales/summary';
  static const String getReportSalesPayment = '/businesses/reports/sales/payment';
  static const String getReportSalesChart = '/businesses/reports/sales/chart';
  static const String getSaleReport = '/businesses/reports/sales/byTime';
  static const String getSaleByChannelReport = '/businesses/reports/sales/byChannel';
  static const String getSaleByAgeGroupReport = '/businesses/reports/sales/byAgeGroup';
  static const String getRefundReport = '/refunds';
  static const String getSaleByShift = '/businesses/reports/sales/shifts';
  static const String getProductSaleReport = '/businesses/reports/products/bySales';
  static const String getProductSaleReportItem = '/businesses/reports/products/bySalesItem';
  static const String getProductLowStockReport = '/businesses/reports/products/lowStock';
  static const String getProductOnHandReport = '/businesses/reports/products/inventory';

  static String getProductOnHandHistory(String id) => '/products/$id/history';

  static String getProductOnHandVariantHistory(
          {required String productID, required String variantID}) =>
      '/products/$productID/variant/$variantID/history';

  static const String getServiceSaleReport = '/businesses/reports/services/bySales';
  static const String getServiceSaleReportItem = '/businesses/reports/services/bySalesItem';
  static const String getServicePerformance = '/businesses/reports/services/performance';
  static const String getBusiestHourReport = '/businesses/reports/services/busiestHours';
  static const String getBusiestDayReport = '/businesses/reports/services/busiestDay';
  static const String getLoyalCustomer = '/businesses/reports/customers/loyal';
  static const String getTopCustomerBySale = '/businesses/reports/customers/BySales';
  static const String getOneTimeCustomer = '/businesses/reports/customers/oneTime';
  static const String getReturningCustomer = '/businesses/reports/customers/topReturning';
  static const String getMonthlyExpense = '/expenses/byMonth';
  static const String getSaleAndExpenses = '/dashboard/salesExpense';
  static const String getEmployeeEarning = '/businesses/reports/employees/earning';
  static const String getEmployeeSalary = '/businesses/reports/employees/salary';
  //#endregion report

  //#region notification
  static const String getNotifications = '/activityFeeds';
  static String readNotification(String id) => '/activityFeeds/$id/read';
  static String getUnreadCountNotification = '/activityFeeds/countUnread';
  static String markAsReadAllNotification = '/activityFeeds/readAll';
  //#endregion notification

  //#region dashboard
  static String dashboard = '/dashboard?period=day';
  static String dashboardSaleStatistic = '/v2/dashboard/statistic';
  static String dashboardTopItem = '/v2/dashboard/topItems';
  static String dashboardTopOrder = '/dashboard/orders';
  static String dashboardSaleSummary = '/v2/dashboard/summary';
  static String dashboardTrending = '/v2/dashboard/trending';
  static String dashboardTopBranches = '/v2/dashboard/topBranches';
  static String dashboardPendingItems = '/v2/dashboard/pendingItems';

  //#endregion dashboard

  //#region POS
  static const String orders = '/orders';
  static const String refundOrders = '/orders/refund';
  static const String discounts = '/businesses/discounts';
  static const String cashActivities = '/businesses/cash-activities';
  static const String summaryAmount = '/businesses/cash-activities/sumAmountInThisSeason';
  static String checkout(String id) => '/orders/$id/checkout';
  static String receipt(String id) => '/orders/$id/receipt';
  //#endregion POS

  //#region Wallet
  static const String payoutDetails = '/businesses/payout-details';
  //#endregion Wallet

  //#region AddOn
  static const String productServiceAddOn = '/product-service-add-on';
  static const String serviceAddOn = '/product-service-add-on/service';
  static const String productAddOn = '/product-service-add-on/product';
  //#endregion AddOn
}

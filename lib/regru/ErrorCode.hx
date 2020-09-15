package regru;

/**
 * Код ошибки.  
 * Енум содержит перечисление всех возможных [кодов ошибок](https://www.reg.ru/support/help/api2#common_errors)
 * в ответах от API.
 */
enum abstract ErrorCode(String) from String to String
{
    ////////////////////////////
    //   ОШИБКИ АВТОРИЗАЦИИ   //
    ////////////////////////////

    /**
     * Не указано имя пользователя.
     */
    var NO_USERNAME = "NO_USERNAME";

    /**
     * Не определён способ авторизации.
     */
    var NO_AUTH = "NO_AUTH";

    /**
     * Ошибка аутентификации по паролю.
     */
    var PASSWORD_AUTH_FAILED = "PASSWORD_AUTH_FAILED";

    /**
     * Только партнёры имеют доступ к этой функции.
     */
    var RESELLER_AUTH_FAILED = "RESELLER_AUTH_FAILED";

    /**
     * Ваш доступ к API заблокирован, обратитесь, пожалуйста, в тех.поддержку.
     */
    var ACCESS_DENIED = "ACCESS_DENIED";

    /**
     * Покупки/заказы для этого аккаунта запрещены.
     */
    var PURCHASES_DISABLED = "PURCHASES_DISABLED";

    /**
     * Доступ к API с этого IP заблокирован.
     */
    var ACCESS_DENIED_FROM_IP = "ACCESS_DENIED_FROM_IP";

    /**
     * Доступ к API с этого IP заблокирован.  
     * Инструкция по восстановлению доступа будет отправлена на электронную почту.
     */
    var ACCESS_DENIED_FROM_IP_WITH_SECRET_WORD = "ACCESS_DENIED_FROM_IP_WITH_SECRET_WORD";

    /**
     * Аккаунт заблокирован.  
     * Инструкции по восстановлению доступа можно получить в Личном Кабинете.
     */
    var ACCOUNT_BLOCKED = "ACCOUNT_BLOCKED";

    /**
     * Неверная почта/логин или пароль.
     */
    var USER_AUTHENTICATION_FAILED = "USER_AUTHENTICATION_FAILED";

    /**
     * Обнаружено несколько аккаунтов с указанным e-mail адресом.  
     * Пожалуйста, введите логин.
     */
    var MORE_THAN_ONE_ACCOUNT_WITH_THE_SAME_EMAIL = "MORE_THAN_ONE_ACCOUNT_WITH_THE_SAME_EMAIL";



    ///////////////////////////////////////////////////////
    //   ОШИБКИ ИДЕНТИФИКАЦИИ ДОМЕНОВ, СЕРВИСОВ, ПАПОК   //
    ///////////////////////////////////////////////////////

    /**
     * Домен `$domain_name` не найден или вы не являетесь его владельцем.
     */
    var DOMAIN_NOT_FOUND = "DOMAIN_NOT_FOUND";

    /**
     * Услуга `$servtype` для домена `$domain_name` не найдена.
     */
    var SERVICE_NOT_FOUND = "SERVICE_NOT_FOUND";

    /**
     * Ошибка идентификации сервиса.
     */
    var SERVICE_NOT_SPECIFIED = "SERVICE_NOT_SPECIFIED";

    /**
     * Услуга с `$service_id` не найдена или вы не является её владельцем.
     */
    var SERVICE_ID_NOT_FOUND = "SERVICE_ID_NOT_FOUND";

    /**
     * `domain_name` не указано или пустое.
     */
    var NO_DOMAIN = "NO_DOMAIN";

    /**
     * Формат `$domain_name` неверен или необслуживаемая зона.
     */
    var INVALID_DOMAIN_NAME_FORMAT = "INVALID_DOMAIN_NAME_FORMAT";

    /**
     * Формат `service_id` неверен.
     */
    var INVALID_SERVICE_ID = "INVALID_SERVICE_ID";

    /**
     * Значение punycode для `$domain_name` не верно.
     */
    var INVALID_DOMAIN_NAME_PUNYCODE = "INVALID_DOMAIN_NAME_PUNYCODE";

    /**
     * Недопустимое значение для `user_servid`.
     */
    var BAD_USER_SERVID = "BAD_USER_SERVID";

    /**
     * Поле `servid` с таким значением уже есть в системе.
     */
    var USER_SERVID_IS_NOT_UNIQUE = "USER_SERVID_IS_NOT_UNIQUE";

    /**
     * Указано слишком много объектов. (Более `$max_objects` в одном запросе)
     */
    var TOO_MANY_OBJECTS_IN_ONE_REQUEST = "TOO_MANY_OBJECTS_IN_ONE_REQUEST";

    /**
     * Клиент с идентификатором `$client_uid` не найден.
     */
    var CLIENT_NOT_FOUND = "CLIENT_NOT_FOUND";



    ////////////////////////////
    //   ОШИБКИ ДОСТУПНОСТИ   //
    ////////////////////////////

    /**
     * Reg.API временно недоступен.
     */
    var SERVICE_UNAVAILABLE = "SERVICE_UNAVAILABLE";

    /**
     * У вас активно другое соединение c Reg.API, связанное с биллинговыми операциями.
     */
    var BILLING_LOCK = "BILLING_LOCK";

    /**
     * Домен `$domain_name` является зарезервированным или недопустимым
     * к регистрации по правилам реестра, либо premium-доменом,
     * предлагаемым по специальной цене.
     */
    var DOMAIN_BAD_NAME = "DOMAIN_BAD_NAME";

    /**
     * Регистрация доменов, имя которых состоит только из цифр, в данной зоне не допускается.
     */
    var DOMAIN_BAD_NAME_ONLYDIGITS = "DOMAIN_BAD_NAME_ONLYDIGITS";

    /**
     * Недопустимо смешивать кириллические и латинские буквы в имени домена.
     */
    var HAVE_MIXED_CODETABLES = "HAVE_MIXED_CODETABLES";

    /**
     * Регистрация доменов в зоне `.$tld` не доступна.
     */
    var DOMAIN_BAD_TLD = "DOMAIN_BAD_TLD";

    /**
     * Регистрация доменов в зоне `.$tld` не доступна.
     */
    var TLD_DISABLED = "TLD_DISABLED";

    /**
     * Русские буквы недопустимы в названии домена для выбранной зоны. (`.$tld`)
     */
    var DOMAIN_NAME_MUSTBEENG = "DOMAIN_NAME_MUSTBEENG";

    /**
     * Латинские буквы недопустимы в названии домена для выбранной зоны. (`.$tld`)
     */
    var DOMAIN_NAME_MUSTBERUS = "DOMAIN_NAME_MUSTBERUS";

    /**
     * Домен уже существует, проверьте через whois.
     */
    var DOMAIN_ALREADY_EXISTS = "DOMAIN_ALREADY_EXISTS";

    /**
     * Недопустимая длина имени домена, вы ввели либо слишком короткое, либо слишком длинное имя.
     */
    var DOMAIN_INVALID_LENGTH = "DOMAIN_INVALID_LENGTH";

    /**
     * Недоступное имя.  
     * Этот домен является зарезервированным, либо premium-доменом, предлагаемым по специальной цене.
     */
    var DOMAIN_STOP_LIST = "DOMAIN_STOP_LIST";

    /**
     * К сожалению, имя `$domain_name` невозможно зарегистрировать.
     */
    var DOMAIN_STOP_PATTERN = "DOMAIN_STOP_PATTERN";

    /**
     * Дата освобождения домена `$domain_name` наступает в будущем, ПОСЛЕ
     * следующей даты массового освобождения доменов.
     */
    var FREE_DATE_IN_FUTURE = "FREE_DATE_IN_FUTURE";

    /**
     * Вы не выбрали ни одного домена для регистрации.
     */
    var NO_DOMAINS_CHECKED = "NO_DOMAINS_CHECKED";

    /**
     * Подача ДОСРОЧНОЙ заявки на регистрацию домена после освобождения
     * невозможна до заключения вами договора о регистрации доменов.
     */
    var NO_CONTRACT = "NO_CONTRACT";

    /**
     * Неверно заданное имя в punycode. (Ошибка при попытке перекодировки из Punycode)
     */
    var INVALID_PUNYCODE_INPUT = "INVALID_PUNYCODE_INPUT";

    /**
     * Не удалось проверить состояние домена: невозможно установить соединение.
     * Попробуйте повторить попытку позднее.
     */
    var CONNECTION_FAILED = "CONNECTION_FAILED";

    /**
     * Доменное имя `$domain_name` уже заказано вами ранее к регистрации,
     * вы можете оплатить его и заявка на регистрацию будет исполнена.
     */
    var DOMAIN_ALREADY_ORDERED = "DOMAIN_ALREADY_ORDERED";

    /**
     * К сожалению, срок делегирования домена `$domain_name` либо уже истёк,
     * либо истекает в ближайшее время.
     */
    var DOMAIN_EXPIRED = "DOMAIN_EXPIRED";

    /**
     * К сожалению, с момента регистрации домена `$domain_name` прошло менее
     * 60-ти дней, попробуйте перенести домен позже.
     */
    var DOMAIN_TOO_YOUNG = "DOMAIN_TOO_YOUNG";

    /**
     * Невозможно определить дату окончания делегирования домена `$domain_name`.
     */
    var CANT_OBTAIN_EXPDATE = "CANT_OBTAIN_EXPDATE";

    /**
     * Домен `$domain_name` запрещён к переносу, cвяжитесь с предыдущим
     * регистратором для разблокирования домена.
     */
    var DOMAIN_CLIENT_TRANSFER_PROHIBITED = "DOMAIN_CLIENT_TRANSFER_PROHIBITED";

    /**
     * Домен `$domain_name` запрещён к переносу вышестоящим регистратором,
     * cвяжитесь со службой технической поддержки для выяснения подробностей.
     */
    var DOMAIN_TRANSFER_PROHIBITED_UNKNOWN = "DOMAIN_TRANSFER_PROHIBITED_UNKNOWN";

    /**
     * Автоматический перенос доменного имени `$domain_name` внутри `DirectI` запрещен.
     */
    var DOMAIN_REGISTERED_VIA_DIRECTI = "DOMAIN_REGISTERED_VIA_DIRECTI";

    /**
     * Не найдены данные для проверки уникальности: `dname`, `servtype` или `user_id`.
     */
    var NOT_FOUND_UNIQUE_REQUIRED_DATA = "NOT_FOUND_UNIQUE_REQUIRED_DATA";

    /**
     * Not found all data for check unique: `market_lot_id`, `servtype`.
     */
    var NOT_FOUND_UNIQUE_REQUIRED_DATA_IN_MARKET = "NOT_FOUND_UNIQUE_REQUIRED_DATA_IN_MARKET";

    /**
     * Заказ `$dname` `$servtype` уже оплачен ранее `$ssru`.
     */
    var ORDER_ALREADY_PAYED = "ORDER_ALREADY_PAYED";

    /**
     * У вас уже есть неоплаченный заказ на `$dname` `$servtype`.
     */
    var DOUBLE_ORDER = "DOUBLE_ORDER";

    /**
     * Заказ или продление домена заблокировано т.к. ещё не завершена другая операция на этот же домен.
     */
    var DOMAIN_ORDER_LOCKED = "DOMAIN_ORDER_LOCKED";

    /**
     * `$tld` не относится к списку поддерживаемых доменных зон.
     */
    var UNAVAILABLE_DOMAIN_ZONE = "UNAVAILABLE_DOMAIN_ZONE";



    ////////////////////////////////////////
    //   ОШИБКИ ПРИ РАБОТЕ С DNS-ЗОНАМИ   //
    ////////////////////////////////////////

    /**
     * Этот домен не использует DNS-сервера REG.RU.
     */
    var DOMAIN_IS_NOT_USE_REGRU_NSS = "DOMAIN_IS_NOT_USE_REGRU_NSS";

    /**
     * Настройка реверсных зон на данный момент не поддерживается.
     */
    var REVERSE_ZONE_API_NOT_SUPPORTED = "REVERSE_ZONE_API_NOT_SUPPORTED";

    /**
     * Ошибка в IP адресе.
     */
    var IP_INVALID = "IP_INVALID";

    /**
     * Неверный поддомен.
     */
    var SUBD_INVALID = "SUBD_INVALID";

    /**
     * Для одного поддомена нельзя указывать записи CNAME совместно с другими записями.
     */
    var CONFLICT_CNAME = "CONFLICT_CNAME";



    ////////////////////////////////////
    //   ОШИБКИ ПРИ РАБОТЕ С DNSSEC   //
    ////////////////////////////////////

    /**
     * Этот домен не поддерживает DNSSEC.
     */
    var DOMAIN_DOESNT_SUPPORT_DNSSEC = "DOMAIN_DOESNT_SUPPORT_DNSSEC";

    /**
     * Невозможно получить информацию из реестра провайдера.
     */
    var CANT_GET_INFO_FROM_REGISTRY = "CANT_GET_INFO_FROM_REGISTRY";

    /**
     * DNSSEC для домена уже находится в процессе обновления.
     */
    var DNSSEC_UPDATING_IN_PROGRESS = "DNSSEC_UPDATING_IN_PROGRESS";

    /**
     * Этот домен использует DNS-сервера REG.RU.
     */
    var DOMAIN_USES_REGRU_NSS = "DOMAIN_USES_REGRU_NSS";

    /**
     * Этот домен не использует DNS-сервера REG.RU.
     */
    //var DOMAIN_IS_NOT_USE_REGRU_NSS = "DOMAIN_IS_NOT_USE_REGRU_NSS"; // <-- Уже определена

    /**
     * Неверные записи.
     */
    var INVALID_RECORDS = "INVALID_RECORDS";



    ///////////////////////
    //   ДРУГИЕ ОШИБКИ   //
    ///////////////////////

    /**
     * Команда `$command_name` не найдена.
     */
    var NO_SUCH_COMMAND = "NO_SUCH_COMMAND";

    /**
     * Доступ к API по небезопасному интерфейсу (http) запрещён!
     * Используйте, пожалуйста, https.
     */
    var HTTPS_ONLY = "HTTPS_ONLY";

    /**
     * `$param` не найден(ы).
     */
    var PARAMETER_MISSING = "PARAMETER_MISSING";

    /**
     * `$param` имеет неверный формат или данные.
     */
    var PARAMETER_INCORRECT = "PARAMETER_INCORRECT";

    /**
     * Недостаточно денег для этой операции.
     */
    var NOT_ENOUGH_MONEY = "NOT_ENOUGH_MONEY";

    /**
     * Внутренняя ошибка: `$error_detail`.
     */
    var INTERNAL_ERROR = "INTERNAL_ERROR";

    /**
     * Операции с услугой запрещены.
     */
    var SERVICE_OPERATIONS_DISABLED = "SERVICE_OPERATIONS_DISABLED";

    /**
     * Валюта не поддерживается в системе.
     */
    var UNSUPPORTED_CURRENCY = "UNSUPPORTED_CURRENCY";

    /**
     * Для `$servtype` цены не найдены.
     */
    var PRICES_NOT_FOUND = "PRICES_NOT_FOUND";

    /**
     * Сервис уже существует.
     */
    var SERVICE_ALREADY_EXISTS = "SERVICE_ALREADY_EXISTS";

    /**
     * Домен не активирован.
     */
    var DOMAIN_IS_NOT_ACTIVE = "DOMAIN_IS_NOT_ACTIVE";
}
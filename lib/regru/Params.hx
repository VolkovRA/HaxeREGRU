package regru;

// Общие входные параметры.
// Конкретный набор необходимых параметров варьируется от функции к функции, однако
// часть параметров применима ко всем или к большинству функций. Эти параметры описаны
// в данном разделе: https://www.reg.ru/support/help/api2#common_input_params.

/**
 * Параметры для аутентификации.
 * 
 * Эти параметры являются необходимыми для функций, требующих аутентификации.
 * Это поля `username` + `password` либо `username` + `signature` (выбор варианта
 * зависит от используемого [способа авторизации](https://www.reg.ru/support/help/api2#common_auth)).
 * Если включена дополнительная проверка SSL-сертификата, то необходимо
 * передавать его в заголовке каждого запроса к API при любом способе аутентификации.
 * 
 * @see Аутентификация: https://www.reg.ru/support/help/api2#common_auth
 * @see Параметры для аутентификации: https://www.reg.ru/support/help/api2#common_auth
 */
typedef AuthParams =
{
    /**
     * Имя пользователя (login) в системе RegRuSRS.
     */
    var username:String;

    /**
     * Аутентификация по паролю.  
     * Основной пароль пользователя в системе регистрации REG.RU, либо альтернативный
     * пароль для API, который задаётся на странице «Настройки Партнёра».  
     */
    @:optional var password:String;

    /**
     * Аутентификация по сигнатуре.  
     * Закодированная Base64 RSA сигнатура sha1 хеша, подписанная ssl-сертификатом.
     */
    @:optional var sig:String;
}

/**
 * Параметры для управления работой API.  
 * К дополнительным параметрам можно отнести общие параметры управления работой API и
 * параметры идентификации услуги.
 * 
 * К общим параметрам управления работой API относятся функции управления форматом
 * входных и выходных параметров функции, выбора рабочей кодировки и языка.
 */
typedef ExtraParams = 
{
    /**
     * Используемая кодировка.  
     * Параметр позволяет явно (вместо стандартной `utf8`) указать кодировку, используемую
     * для обмена данными (в данный момент поддерживаются `cp1251`, `koi8-r`, `koi8-u`, `cp866`).
     * 
     * По умолчанию: `utf8`
     */
    @:optional var io_encoding:String;

    /**
     * **Управление входными данными**  
     * Формат данных, передаваемый при вызове функции API.  
     * Сами данные при этом передаются с полем `input_data`. На данный момент обрабатываются
     * значения `json` и `xml`, любое другое приравнивается к значению по умолчанию, `plain`,
     * и разбор данных не производится.
     * 
     * По умолчанию: `plain`
     */
    @:optional var input_format:String;

    /**
     * **Управление входными данными**  
     * Данные в формате, указанном в `input_format`. При этом данные аутентификации
     * (`username` + `password`/`signature`) не должны передаваться внутри `input_data`.
     * 
     * По умолчанию: `—`
     */
    @:optional var input_data:String;

    /**
     * **Управление выходными данными**  
     * Параметр позволяет задать формат ответов системы — «json» (по умолчанию), «yaml»,
     * «xml» или «plain» (формат REG.API 1.0). В отношении YAML надо отметить, что данные
     * отдаются закодированными в Base64.
     * 
     * По умолчанию: `json`
     */
    @:optional var output_format:String;

    /**
     * **Управление выходными данными**  
     * Синоним для `output_format`. Устарело.  
     * По умолчанию: `json`
     */
    @:deprecated
    @:optional var view:String;

    /**
     * **Управление выходными данными**  
     * Возможность задать `content type`, не изменяя формата ответа, для `text/plain`
     * достаточно указать `plain`.
     * 
     * По умолчанию: Зависит от значения поля `output_format`.
     */
    @:optional var output_content_type:String;

    /**
     * **Управление выходными данными**  
     * Язык текста ошибки `error_text`, сейчас доступны русский, английский и тайский:
     * `ru`, `en`, `th`. При этом код ошибки `error_code` остаётся неизменным.
     * 
     * По умолчанию текст ошибок: английский.
     */
    @:optional var lang:String;

    /**
     * **Управление выходными данными**  
     * Возвращает все входные поля как хеш параметра `input_params`, при этом если
     * входные данные были в json или xml формате, то данные отображаются после
     * обработки json- или xml-парсером. Т.е. если указать `input_format=json` и
     * `output_format=xml`, то для `input_params` будет сделано преобразование из
     * JSON в XML.
     * 
     * По умолчанию: `0`
     */
    @:optional var show_input_params:String;
}

/**
 * Параметры для идентификации услуги.  
 * Параметры идентификации услуги требуются при выполнении операций над конкретной
 * ранее заказанной услугой, когда её надо сначала идентифицировать.
 * 
 * Возможны следующие варианты идентификации:
 * 1. По ID услуги (как для доменов, так и для услуг).
 * 2. По имени домена (для доменов).
 * 3. По имени домена и типу услуги (для услуг).
 * 4. По ID родительской услуги, типу услуги и подтипу услуги (для услуг).
 * 
 * Наиболее точной и быстрой является идентификация по числовому идентификатору услуги,
 * поэтому мы рекомендуем хранить на своей стороне и использовать ID домена/услуги и
 * при вызовах передавать идентификатор услуги.
 */
typedef ServiceParams =
{
    /**
     * **Идентификация по ID-услуги (рекомендуется)**  
     * Числовой идентификатор услуги.
     */
    @:optional var service_id:Int;

    /**
     * **Идентификация по ID-услуги, задаваемому пользователем**  
     * Число-буквенный идентификатор услуги, для его использования надо сам
     * идентификатор задать при создании услуги/домена. Получить ранее заданный
     * идентификатор можно используя функцию [service/get_info](https://www.reg.ru/support/help/api2#service_get_info).
     */
    @:optional var user_servid:String;

    /**
     * **Идентификация доменов по имени**  
     * Имя домена. Русские имена доменов передаются в кодировке punycode либо
     * в национальной кодировке.
     * 
     * **Идентификация услуг по имени домена и типу услуги ([кроме VPS](https://www.reg.ru/support/help/api2#except_vps))**  
     * Имя домена, к которому привязана услуга. Русские имена доменов передаются
     * в кодировке punycode либо в национальной кодировке.
     */
    @:optional var domain_name:String;

    /**
     * **Идентификация услуг по имени домена и типу услуги ([кроме VPS](https://www.reg.ru/support/help/api2#except_vps))**  
     * Тип услуги. Например «srv_hosting_ispmgr» для хостинга или «srv_webfwd»
     * для услуги web-forwarding.  
     * 
     * **Идентификация услуг по ID родительской услуги, типу услуги и подтипу услуги**  
     * Подтип услуги. Например «pro» для лицензии ISP Manager Pro.
     */
    @:optional var servtype:String;

    /**
     * **Идентификация услуг по ID родительской услуги, типу услуги и подтипу услуги**  
     * ID родительской услуги, с которой связана искомая услуга.
     */
    @:optional var uplink_service_id:String;

    /**
     * **Идентификация услуг по ID родительской услуги, типу услуги и подтипу услуги**  
     * Подтип услуги. Например «pro» для лицензии ISP Manager Pro.
     */
    @:optional var subtype:String;
}

/**
 * Параметры для идентификации списка услуг.
 */
typedef ServiceListParams =
{
    /**
     * Список, каждый элемент которого содержит имя домена или его `service_id`
     * в соответствии со [стандартными параметрами идентификации услуги](https://www.reg.ru/support/help/api2#common_service_identification_params).
     * 
     * В одном запросе можно обратиться не более чем к 1000 услугам.
     */
    @:optional var domains:Array<ServiceParams>;

    /**
     * Список, каждый элемент которого содержит имя домена + тип сервиса или его
     * `service_id` в соответствии со [стандартными параметрами идентификации услуги](https://www.reg.ru/support/help/api2#common_service_identification_params).
     */
    @:optional var services:Array<ServiceParams>;
}

/**
 * Параметры для идентификации папки.  
 * Наиболее точной и быстрой идентификацией папок является идентификация по числовому
 * идентификатору папки `folder_id`, поэтому мы рекомендуем хранить на своей стороне и
 * использовать ID папки и при вызовах передавать числовой идентификатор папки.
 */
typedef FolderParams =
{
    /**
     * Числовой идентификатор папки (рекомендуется).
     */
    @:optional var folder_id:Int;

    /**
     * Имя папки.
     */
    @:optional var folder_name:String;
}

/**
 * Параметры оплаты.  
 * В данном разделе описаны общие параметры для функций, связанных с заказом или
 * продлением услуг, т. е. функций, которые задействуют оплату.
 */
typedef PayParams = 
{
    /**
     * Любая строка, идентифицирующая систему / интернет-сайт, через который
     * покупателем сделан заказ на данный домен. Необязательное поле.
     * 
     * Пример: `regpanel.ru`.
     */
    @:optional var point_of_sale:String;

    /**
     * Способ оплаты счёта.  
     * На данный момент доступные такие варианты оплаты: (`bank`, `pbank`, `prepay`,
     * `yamoney`, `robox`, `paymer`, `chronopay`)
     * 
     * Заметьте, что автоматически счёт может быть оплачен только при выборе способа
     * оплаты `prepay` и наличии достаточного количества средств на лицевом счёте.
     * В противном случае заявка будет помечена как неоплаченная и Вам нужно убдет
     * вручную оплачивать её из «Личного кабинета».
     * 
     * По умолчанию: `prepay`
     */
    @:optional var pay_type:PayType;

    /**
     * Разрешает создавать счет, если денег для оплаты недостаточно. В этом случае
     * заявка в системе создаётся, однако эта заявка будет исполнена только после
     * выполнения операции «сменить способ оплаты счёта» через web-интерфейс системы.
     * Если флаг не установлен и денег на счёте недостаточно - возвращается ошибка
     * и заявка не создается.
     */
    @:optional var ok_if_no_money:Any;
}

/**
 * Способ оплаты счёта.  
 * Енум содержит перечисление всех возможных [кодов ошибок](https://www.reg.ru/support/help/api2#common_errors)
 * в ответах от API.
 */
enum abstract PayType(String) to String
{
    var PREPAY = "prepay";
    var BANK = "bank";
    var PBANK = "pbank";
    var YAMONEY = "yamoney";
    var ROBOX = "robox";
    var PAYMER = "paymer";
    var CHRONOPAY = "chronopay";
}
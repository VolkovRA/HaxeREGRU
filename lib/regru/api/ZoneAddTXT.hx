package regru.api;

import loader.Method;
import regru.Params;
import regru.Response;

/**
 * Функция для добавления произвольной TXT записи поддомену.
 * - **Доступность**: Клиенты
 * - **Назначение**: Добавление произвольной текстовой записи (TXT) поддомену.
 * @see Документация: https://www.reg.ru/support/help/api2#zone_add_txt
 */
class ZoneAddTXT extends Request<ZoneAddTXTParams, Response<ZoneAddTXTResponse>, ZoneAddTXT>
{
    /**
     * Создать новый экземпляр.
     */
    @:allow(regru.RegRU)
    private function new(parent:RegRU, ?params:ZoneAddTXTParams) {
        super(parent, params);

        request.url = parent.url + "zone/add_txt";
        request.method = Method.POST;
        request.data = params;
    }
}

/**
 * Параметры для вызова.
 */
typedef ZoneAddTXTParams =
{
    >AuthParams,
    >ExtraParams,
    >ServiceParams,
    >ServiceListParams,

    /**
     * Имя поддомена, для которого добавляется текстовая запись.
     */
    var subdomain:String;

    /**
     * Текст, допустимо использовать только алфавитноцифровые символы из набора ASCII.
     */
    var text:String;
}

/**
 * Формат ответа.
 */
typedef ZoneAddTXTResponse =
{
    /**
     * Список доменов, где для доменов у которых можно управлять зоной поле
     * `result` будет иметь значение `success`, иначе — код ошибки указывающий причину.
     */
    var domains:Array<DomainZoneAddTXTResponse>;
}

/**
 * Данные по домену.
 */
typedef DomainZoneAddTXTResponse =
{
    >ErrorResponse,

    /**
     * Результат вызова.
     */
    var result:ResultType;

    /**
     * Имя домена.
     */
    @:optional var dname:String;

    /**
     * ID Услуги. (Домена)
     */
    @:optional var service_id:String;

    /**
     * Тип услуги.
     */
    @:optional var servtype:String;
}
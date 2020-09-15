package regru.api;

import loader.Method;
import regru.Params;
import regru.Response;

/**
 * Функция для управления DNS-зоной.
 * - **Доступность**: Клиенты
 * - **Назначение**: Для тестирования, позволяет проверить доступность управления
 *   DNS-зоной доменов. Управление DNS-зоной возможно только если домену прописаны
 *   DNS сервера REG.RU.
 * @see Документация: https://www.reg.ru/support/help/api2#zone_nop
 */
class ZoneNop extends Request<ZoneNopParams, Response<ZoneNopResponse>, ZoneNop>
{
    /**
     * Создать новый экземпляр.
     */
    @:allow(regru.RegRU)
    private function new(parent:RegRU, ?params:ZoneNopParams) {
        super(parent, params);

        request.url = parent.url + "zone/nop";
        request.method = Method.POST;
        request.data = params;
    }
}

/**
 * Параметры для вызова.
 */
typedef ZoneNopParams =
{
    >AuthParams,
    >ExtraParams,
    >ServiceParams,
    >ServiceListParams,
}

/**
 * Формат ответа.
 */
typedef ZoneNopResponse =
{
    /**
     * Список доменов, где для доменов у которых можно управлять зоной поле
     * `result` будет иметь значение `success`, иначе — код ошибки указывающий причину.
     */
    var domains:Array<DomainZoneNopResponse>;
}

/**
 * Данные по домену.
 */
typedef DomainZoneNopResponse =
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
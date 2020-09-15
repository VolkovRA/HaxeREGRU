package regru.api;

import regru.DNSRecordType;
import loader.Method;
import regru.Params;
import regru.Response;

/**
 * Функция для удаления ресурсной записи домена.
 * - **Доступность**: Клиенты
 * - **Назначение**: Удалить ресурсную запись.
 * @see Документация: https://www.reg.ru/support/help/api2#zone_remove_record
 */
class ZoneRemoveRecord extends Request<ZoneRemoveRecordParams, Response<ZoneRemoveRecordResponse>, ZoneRemoveRecord>
{
    /**
     * Создать новый экземпляр.
     */
    @:allow(regru.RegRU)
    private function new(parent:RegRU, ?params:ZoneRemoveRecordParams) {
        super(parent, params);

        request.url = parent.url + "zone/remove_record";
        request.method = Method.POST;
        request.data = params;
    }
}

/**
 * Параметры для вызова.
 */
typedef ZoneRemoveRecordParams =
{
    >AuthParams,
    >ExtraParams,
    >ServiceParams,
    >ServiceListParams,

    /**
     * Поддомен для которого будет удаляться запись.
     */
    var subdomain:String;

    /**
     * Класс, тип удаляемой записи.
     */
    var record_type:DNSRecordType;

    /**
     * Приоритет записи.  
     * Неприменимо к запросу удаления А-записи (и аналогичных записей).
     * 
     * По умолчанию: `0`
     */
    @:optional var priority:Int;

    /**
     * Содержимое записи.  
     * Опциональное поле, при его отсутствии помечаются к удалению все записи,
     * попадающие под условие остальных параметров.
     * 
     * По умолчанию: `0`
     */
    @:optional var content:String;
}

/**
 * Формат ответа.
 */
typedef ZoneRemoveRecordResponse =
{
    /**
     * Список доменов c результатами выполнения запроса.
     */
    var domains:Array<DomainZoneRemoveRecordResponse>;
}

/**
 * Результат выполнения.
 */
typedef DomainZoneRemoveRecordResponse =
{
    >ErrorResponse,

    /**
     * Результат вызова.
     */
    var result:ResultType;

    /**
     * ID Услуги. (Домена)
     */
    @:optional var service_id:String;
}
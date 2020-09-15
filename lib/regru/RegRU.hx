package regru;

import loader.Balancer;
import regru.api.CommonNop;
import regru.api.ZoneNop;
import regru.api.ZoneAddTXT;
import regru.api.ZoneRemoveRecord;

/**
 * API Интерфейс хостинга REGRU.  
 * Реализуемая версия API: `2.0`.
 * @see Документация: https://www.reg.ru/support/help/api2
 */
@:dce
class RegRU
{
    /**
     * Создать новый экземпляр.
     */
    public function new(){
        balancer = new Balancer();
    }
    
    /**
     * URL Адрес для выполнения запросов к API.  
     * Не может быть `null`.
     */
    public var url:String = "https://api.reg.ru/api/regru2/";

    /**
     * Балансировщик запросов к API.  
     * Используется для ограничения частоты отправки запросов.
     * По умолчанию все запросы отправляются не чаще чем `1` раз в сек.  
     * Не может быть `null`.
     */
    public var balancer(default, null):Balancer;

    /**
     * Проверка доступности.  
     * Для тестирования, здесь — ничегонеделание + получение логина и
     * идентификатора залогиненого пользователя.
     * @param params Параметры запроса.
     * @param callback Функция для обратного вызова. По умолчанию: `null`.
     * @param priority Приоритет для выполнения запроса. По умолчанию: `0`.
     * @see Документация: https://www.reg.ru/support/help/api2#common_nop
     */
    public function nop(?params:CommonNopParams, ?callback:CommonNop->Void, ?priority:Int):CommonNop {
        var item = new CommonNop(this, params);
        item.callback = callback==null?null:callback;
        item.priority = priority>0?priority:0;
        item.load();
        return item;
    }

    /**
     * Тестирование сервиса управления DNS зоной.  
     * Позволяет проверить доступность управления DNS-зоной доменов.
     * Возвращает идентификатор (id) услуги (домена).
     * Управление DNS-зоной возможно только если домену прописаны DNS сервера REG.RU.
     * @param params Параметры запроса.
     * @param callback Функция для обратного вызова. По умолчанию: `null`.
     * @param priority Приоритет для выполнения запроса. По умолчанию: `0`.
     * @return Документация: https://www.reg.ru/support/help/api2#zone_nop
     */
    public function zoneNop(?params:ZoneNopParams, ?callback:ZoneNop->Void, ?priority:Int):ZoneNop {
        var item = new ZoneNop(this, params);
        item.callback = callback==null?null:callback;
        item.priority = priority>0?priority:0;
        item.load();
        return item;
    }

    /**
     * Добавление произвольной TXT записи поддомену.
     * Управление DNS-зоной возможно только если домену прописаны DNS сервера REG.RU.
     * @param params Параметры запроса.
     * @param callback Функция для обратного вызова. По умолчанию: `null`.
     * @param priority Приоритет для выполнения запроса. По умолчанию: `0`.
     * @return Документация: https://www.reg.ru/support/help/api2#zone_add_txt
     */
    public function zoneAddTXT(?params:ZoneAddTXTParams, ?callback:ZoneAddTXT->Void, ?priority:Int):ZoneAddTXT {
        var item = new ZoneAddTXT(this, params);
        item.callback = callback==null?null:callback;
        item.priority = priority>0?priority:0;
        item.load();
        return item;
    }

    /**
     * Удаление ресурсной записи домена.
     * Управление DNS-зоной возможно только если домену прописаны DNS сервера REG.RU.
     * @param params Параметры запроса.
     * @param callback Функция для обратного вызова. По умолчанию: `null`.
     * @param priority Приоритет для выполнения запроса. По умолчанию: `0`.
     * @return Документация: https://www.reg.ru/support/help/api2#zone_remove_record
     */
    public function zoneRemoveRecord(?params:ZoneRemoveRecordParams, ?callback:ZoneRemoveRecord->Void, ?priority:Int):ZoneRemoveRecord {
        var item = new ZoneRemoveRecord(this, params);
        item.callback = callback==null?null:callback;
        item.priority = priority>0?priority:0;
        item.load();
        return item;
    }

    /**
     * Получить текстовое представление объекта.
     * @return Текстовое описание объекта.
     */
    @:keep
    public function toString():String {
        return '[RegRU]';
    }
}
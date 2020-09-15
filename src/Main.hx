package;

import regru.RegRU;
import regru.DNSRecordType;

/**
 * Пример использования.
 */
class Main
{
    static private var USER_NAME:String = "USERNAME";
    static private var PSWD:String = "********";

    /**
     * Точка входа.
     */
    static function main() {
        var api = new RegRU();

        // Проверка API:
        api.nop(
            {
                username: USER_NAME,
                password: PSWD
            },
            function(item) {
                trace(item.error);
                trace(item.data);
            }
        );

        /*
        // Проверка API DNS:
        api.zoneNop(
            {
                domain_name: "funnycarrot.ru",
                username: USER_NAME,
                password: PSWD
            },
            function(item) {
                trace(item.error);
                trace(item.data);
            }
        );
        */

        /*
        // Добавление TXT записи к домену:
        api.zoneAddTXT(
            {
                domain_name: "funnycarrot.ru",
                subdomain: "funnycarrot",
                text: "Hello!",
                username: USER_NAME,
                password: PSWD
            },
            function(item) {
                trace(item.error);
                trace(item.data);
            }
        );
        */

        /*
        // Удаление всех TXT записей с домена:
        api.zoneRemoveRecord(
            {
                domain_name: "funnycarrot.ru",
                subdomain: "funnycarrot",
                record_type: DNSRecordType.TXT,
                username: USER_NAME,
                password: PSWD
            },
            function(item){
                trace(item.error);
                trace(item.data);
            }
        );
        */
    }
}
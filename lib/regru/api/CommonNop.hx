package regru.api;

import loader.Method;
import regru.Params;

/**
 * Функция общего назначения.
 * - **Доступность**: Клиенты
 * - **Назначение**: Для тестирования, здесь — ничегонеделание + получение логина и
 *   идентификатора залогиненого пользователя.
 * @see Документация: https://www.reg.ru/support/help/api2#common_nop
 */
class CommonNop extends Request<CommonNopParams, Response<CommonNopResponse>, CommonNop>
{
    /**
     * Создать новый экземпляр.
     */
    @:allow(regru.RegRU)
    private function new(parent:RegRU, ?params:CommonNopParams) {
        super(parent, params);

        request.url = parent.url + "nop";
        request.method = Method.POST;
        request.data = params;
    }
}

/**
 * Параметры для вызова.
 */
typedef CommonNopParams =
{
    >AuthParams,
    >ExtraParams,
}

/**
 * Формат ответа.
 */
typedef CommonNopResponse =
{
    /**
     * Имя пользователя, переданное в запросе как `username`.
     */
    var login:String;

    /**
     * Идентификатор пользователя в системе.
     */
    var user_id:Int;
}
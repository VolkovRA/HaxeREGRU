package regru;

/**
 * Формат ответа.  
 * Все функции могут возвращать ответы в форматах JSON, YAML, XML и plain text.
 * По умолчанию используется JSON. Выходной формат передачи данных переключается
 * с помощью опции [output_format](https://www.reg.ru/support/help/api2#common_api_management_params).
 * 
 * Некоторые функции имеют дополнительные форматы вывода, помимо перечисленных.
 * Например, функция `get_rereg_data` может отдавать данные в CSV формате.
 * 
 * @see Документация: https://www.reg.ru/support/help/api2#common_response_format
 */
typedef Response<T:Dynamic> =
{
    >ErrorResponse, // <-- Первый уровень ошибки. (Терминалогия REG.RU)

    /**
     * Результат выполнения запроса к API.  
     * В случае успеха имеет значение: `success`
     */
    @:optional var result:ResultType;

    /**
     * Ответ сервера.  
     * Тип данных зависит от вызываемой функции API.
     */
    @:optional var answer:T;

    /**
     * Используемая кодировка.  
     * Пример: `utf-8`
     */
    @:optional var charset:String;

    /**
     * Хеш с параметрами, переданными при вызове функции.  
     * Присутствует, если вызов был с `show_input_params=1`.
     */
    @:optional var input_params:String;
}

/**
 * Ошибка запроса.  
 * Используется для описания ошибки при выполнении метода API.
 * Все ошибки стандартизированы.
 */
typedef ErrorResponse =
{
    /**
     * Результат выполнения запроса к API.  
     * В случае ошибки имеет значение: `error`
     */
    @:optional var result:ResultType;

    /**
     * Код ошибки, который представляет собой предложение в верхнем регистре с
     * использованием "_" в качестве разделителей и является уникальным внутри
     * системы. Предназначен для анализа ошибок на уровне программ.
     * Для пользователей создано поле `error_text`.
     */
    @:optional var error_code:ErrorCode;

    /**
     * Подробное описание ошибки на английском или русском, в зависимости от
     * входного параметра `lang`.
     */
    @:optional var error_text:String;

    /**
     * Параметры, подставляемые в стандартный текст ошибки, могут быть полезны
     * при автоматическом разборе ошибок.
     */
    @:optional var error_params:Dynamic;

    /**
     * Хеш с параметрами, переданными при вызове функции.  
     * Присутствует, если вызов был с `show_input_params=1`.
     */
    @:optional var input_params:String;
}

/**
 * Результат выполнения запроса.  
 * Используется для быстрой идентификаци успешного выполнения метода API.
 */
enum abstract ResultType(String) from String to String
{
    /**
     * Ошибка.
     */
    var ERROR = "error";

    /**
     * Успех.
     */
    var SUCCESS = "success";
}
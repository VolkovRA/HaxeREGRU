package regru;

import js.lib.Error;
import loader.ILoader;
import loader.LoaderState;

/**
 * Запрос к API.  
 * Это абстрактный, базовый класс описывающий выполнение
 * любого запроса к API. Вы не должны создавать экземпляры
 * этого класса, вместо этого, вы можете получить их при
 * вызове методов: `RegRU`.
 * 
 * *п.с. Классы наследники определяют точную типизацию для
 * каждого конкретного вида запроса.*
 */
@:dce
class Request<P:Dynamic, R:Response<Dynamic>, T:Request<P,R,T>>
{
    /**
     * Автоматический счётчик для новых, уникальных ID.
     */
    static public var autoID(default, null):Int = 0;

    /**
     * Загрузчик для выполнения запроса.  
     * Классы наследники не должны использовать это свойство.
     */
    private var loader:ILoader;

    /**
     * Параметры для выполнения запроса к API.  
     * Классы - наследники **должны** настроить этот объект в своём
     * **конструкторе** для уточнения параметров выполняемого запроса.
     */
    private var request:loader.Request;

    /**
     * Создать новый запрос.
     * @param parent Родительский объект.
     * @param params Параметры запроса.
     * @throws Error Родительский объект не должен быть `null`.
     */
    private function new(parent:RegRU, ?params:P) {
        if (parent == null)
            throw new Error("Parent object cannot be null");

        this.id = ++autoID;
        this.parent = parent;
        this.params = params==null?null:params;

        // Реализация загрузчика:
        #if nodejs
        loader = new loader.nodejs.LoaderNodeJS();
        request = new loader.Request();
        #else
        loader = new loader.xhr.LoaderXHR();
        request = new loader.Request();
        #end
    }

    /**
     * ID Запроса.  
     * Уникален в рамках выполняемой программы.
     * Может быть полезен для ссылки на экземпляры запросов.  
     * Не может быть `null`.
     */
    public var id(default, null):Int;

    /**
     * Ссылка на родительский объект, к которому относится
     * данный экземпляр.  
     * Не может быть `null`.
     */
    public var parent(default, null):RegRU;

    /**
     * URL Адрес выполняемого запроса.  
     * Не может быть `null`.
     */
    public var url(get, never):String;
    inline function get_url():String {
        return request.url;
    }

    /**
     * Список параметров, переданных в запросе к API.  
     * Может быть `null`. *(Если не переданы)*
     */
    public var params(default, null):P;

    /**
     * Ответ от сервера API.  
     * Данные становятся доступными после получения ответа.  
     * По умолчанию: `null`.
     */
    public var data:R = null;

    /**
     * Произвольные, пользовательские данные.  
     * Вы можете сохранить любые данные в этом свойстве для
     * их использования в будущем.  
     * Это значение никак не регулируется.
     * 
     * По умолчанию: `null`
     */
    public var userData:Dynamic = null;

    /**
     * Колбек завершения вызова.  
     * Вызывается после завершения запроса к API.  
     * Может быть `null`. *(Если не передан)*
     */
    public var callback:T->Void = null;

    /**
     * Ошибка выполнения запроса.  
     * Перед доступом к свойству `data` проверьте это на предмет
     * наличия ошибок.  
     * По умолчанию: `null`
     */
    public var error(default, null):Error = null;

    /**
     * Приоритет для выполнения запроса.  
     * Это значение влияет на то, какой запрос к API будет отправлен
     * первым. Используется совместно с балансировщиком: `RegRU.balancer`.
     * Чем выше приоритет, тем раньше запрос улетит к API.  
     * По умолчанию: `0`
     */
    @:allow(regru.RegRU)
    public var priority(default, null):Int = 0;

    /**
     * Запустить выполнение запроса.
     */
    @:allow(regru.RegRU)
    private function load():Void {
        if (loader == null)
            throw new Error("Loader is closed");
        if (loader.state != LoaderState.READY)
            throw new Error("Loader is not ready");

        loader.onComplete = function(item) {
            if (loader == null)
                return;
            error = item.error;
            data = item.data;
            if (callback != null)
                callback(untyped this);
        };
        loader.load(request);
    }

    /**
     * Отменить выполнение запроса.  
     * - Удаляет из очереди на отправку запросов, если этот
     *   запрос ещё не отправлен.
     * - Прерывает активный запрос, если он выполняется.
     * - Колбек не вызывается.
     * - Никакие данные не удаляются.
     */
    public function close():Void {
        if (loader != null) {
            loader.close();
            loader = null;
        }
    }

    /**
     * Получить строковое описание этого запроса.
     * @return Строковое описание этого экземпляра.
     */
    @:keep
    public function toString():String {
        return "[Request url=" + url + "]";
    }
}
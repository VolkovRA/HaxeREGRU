package regru;

/**
 * Тип ресурсной записи [DNS](https://ru.wikipedia.org/wiki/DNS).  
 * Этот enum содержит перечисление всех типов [ресурсных записей DNS](https://ru.wikipedia.org/wiki/%D0%A2%D0%B8%D0%BF%D1%8B_%D1%80%D0%B5%D1%81%D1%83%D1%80%D1%81%D0%BD%D1%8B%D1%85_%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D0%B5%D0%B9_DNS).
 * Значения ключей указаны для использования в API REGRU.
 * 
 * *п.с. Полная проверка на совместимость с API REG.RU не производилась.*
 */
enum abstract DNSRecordType(String) from String to String
{
    /**
     * **Address**  
     * Адресная запись, соответствие между именем и IP-адресом.
     * Одна из самых часто используемых записей.
     * 
     * Код: `1`
     * 
     * [RFC 1035](https://tools.ietf.org/html/rfc1035)
     */
    var A = "A";

    /**
     * Address version 6.  
     * Адрес в формате [IPv6](https://ru.wikipedia.org/wiki/IPv6).
     * Заменена на AAAA из-за чрезмерной сложности в реализации, статус «экспериментальна»,
     * позже устарела в RFC 6563.
     * 
     * Код: `38`
     * 
     * [RFC 3363](https://tools.ietf.org/html/rfc3363), [RFC 2874](https://tools.ietf.org/html/rfc2874), [RFC 6563](https://tools.ietf.org/html/rfc6563).
     */
    var A6 = "A6";

    /**
     * **Адрес в формате IPv6**. (A+1+1+1)  
     * A использовался для [IPv4](https://ru.wikipedia.org/wiki/IPv4), AAAA для IPv6.
     * Эквивалент А для IPV6.
     * 
     * Код: `28`
     * 
     * [RFC 3596](https://tools.ietf.org/html/rfc3596)
     */
    var AAAA = "AAAA";

    /**
     * AFS database. *(Редкоупотребимая)*  
     * Расположение базы данных [AFS](https://ru.wikipedia.org/wiki/Andrew_File_System). (AFS database)  
     * Редкоупотребимая, чаще используется SRV-запись.
     * 
     * Код: `18`
     * 
     * [RFC 1183](https://tools.ietf.org/html/rfc1183)
     */
    var AFSDB = "AFSDB";

    /**
     * Application Visibility and Control.  
     * Видимость и контроль приложений.
     * 
     * Код: `258`
     * 
     * [RFC: AVC/avc-completed-template](https://www.iana.org/assignments/dns-parameters/AVC/avc-completed-template)
     */
    var AVC = "AVC";

    /**
     * Certification Authority Restriction.  
     * Авторизованный центр сертификации.
     * 
     * Код: `257`
     * 
     * [RFC 6844](https://tools.ietf.org/html/rfc6844)
     */
    var CAA = "CAA";

    /**
     * **Canonical name**  
     * Каноническое имя для псевдонима (одноуровневая переадресация).
     * Широко используется (но имеет ограничения по применению).
     * 
     * Код: `5`
     * 
     * [RFC 1035](https://tools.ietf.org/html/rfc1035)
     */
    var CNAME = "CNAME";

    /**
     * Domain Name.  
     * Псевдоним для домена.
     * 
     * Код: `39`
     * 
     * [RFC 6672](https://tools.ietf.org/html/rfc6672)
     */
    var DNAME = "DNAME";

    /**
     * DNS Key record.  
     * Ключ подписи в [DNSSEC](https://ru.wikipedia.org/wiki/DNSSEC). Формат — как в записи KEY.
     * 
     * Код: `48`
     * 
     * [RFC 4034](https://tools.ietf.org/html/rfc4034)
     */
    var DNSKEY = "DNSKEY";

    /**
     * Delegation signer.  
     * [Отпечаток](https://ru.wikipedia.org/wiki/%D0%9E%D1%82%D0%BF%D0%B5%D1%87%D0%B0%D1%82%D0%BE%D0%BA_%D0%BE%D1%82%D0%BA%D1%80%D1%8B%D1%82%D0%BE%D0%B3%D0%BE_%D0%BA%D0%BB%D1%8E%D1%87%D0%B0)
     * (fingerprint) ключа подписи в [DNSSEC](https://ru.wikipedia.org/wiki/DNSSEC).
     * 
     * Код: `43`
     * 
     * [RFC 3658](https://tools.ietf.org/html/rfc3658)
     */
    var DS = "DS";

    /**
     * ~~Geographical position~~. *(Устарела)*  
     * Географическое положение. Устарела, см. LOC.
     * 
     * Код: `27`
     * 
     * [RFC 1712](https://tools.ietf.org/html/rfc1712)
     */
    var GPOS = "GPOS";

    /**
     * Host Information. *(Редкоупотребима)*  
     * Информация об узле.
     * 
     * Код: `13`
     * 
     * [RFC 1035](https://tools.ietf.org/html/rfc1035)
     */
    var HINFO = "HINFO";

    /**
     * ISDN address. *(Редкоупотребима)*  
     * Адрес в формате [ISDN](https://ru.wikipedia.org/wiki/ISDN).
     * Редкоупотребима (из-за малой популярности сетей ISDN без IP-маршрутизации)
     * 
     * Код: `20`
     * 
     * [RFC 1183](https://tools.ietf.org/html/rfc1183)
     */
    var ISDN = "ISDN";

    /**
     * Public key. *(Малоупотребима)*  
     * Открытый ключ, используется в [DNSSEC](https://ru.wikipedia.org/wiki/DNSSEC).
     * 
     * Код: `25`
     * 
     * [RFC 2535](https://tools.ietf.org/html/rfc2535), [RFC 3445](https://tools.ietf.org/html/rfc3445)
     */
    var KEY = "KEY";

    /**
     * Key Exchanger.
     * 
     * Код: `36`
     * 
     * [RFC 2230](https://tools.ietf.org/html/rfc2230)
     */
    var KX = "KX";

    /**
     * Location information.  
     * Географическое местоположение домена.
     * 
     * Код: `29`
     * 
     * [RFC 1876](https://tools.ietf.org/html/rfc1876)
     */
    var LOC = "LOC";

    /**
     * Mailbox. *(Редкоупотребима, экспериментальна)*  
     * Почтовый ящик.
     * 
     * Код: `7`
     * 
     * [RFC 1035](https://tools.ietf.org/html/rfc1035)
     */
    var MB = "MB";

    /**
     * ~~Mail destination~~. *(Устарела)*  
     * Почтовый адрес.
     * 
     * Код: `3`
     * 
     * [RFC 1035](https://tools.ietf.org/html/rfc1035)
     */
     var MD = "MD";

    /**
     * ~~Mail forwarder~~. *(Устарела)*  
     * Перенаправление почты.
     * 
     * Код: `4`
     * 
     * [RFC 1035](https://tools.ietf.org/html/rfc1035)
     */
    var MF = "MF";

    /**
     * Mail group member. *(Редкоупотребима, экспериментальна)*  
     * Номер почтовой группы.
     * 
     * Код: `8`
     * 
     * [RFC 1035](https://tools.ietf.org/html/rfc1035)
     */
    var MG = "MG";

    /**
     * Mailbox or mailing list information. *(Экспериментальна)*  
     * Информация о почтовом ящике или рассылке.
     * 
     * Код: `14`
     * 
     * [RFC 1035](https://tools.ietf.org/html/rfc1035)
     */
    var MINFO = "MINFO";

    /**
     * Mail rename domain name. *(Редкоупотребима, экспериментальна)*  
     * 
     * Код: `9`
     * 
     * [RFC 1035](https://tools.ietf.org/html/rfc1035)
     */
    var MR = "MR";

    /**
     * **Mail Exchanger**  
     * Адрес почтового шлюза для домена. Состоит из двух частей — приоритета (чем
     * число больше, тем ниже приоритет), и адреса узла.  
     * Критически важна для [SMTP](https://ru.wikipedia.org/wiki/SMTP)-протокола,
     * основа маршрутизации [почты](https://ru.wikipedia.org/wiki/%D0%AD%D0%BB%D0%B5%D0%BA%D1%82%D1%80%D0%BE%D0%BD%D0%BD%D0%B0%D1%8F_%D0%BF%D0%BE%D1%87%D1%82%D0%B0)
     * в Интернете.
     * 
     * Код: `15`
     * 
     * [RFC 1035](https://tools.ietf.org/html/rfc1035)
     */
    var MX = "MX";

    /**
     * Naming authority pointer. *(Малоупотребима)*  
     * Указатель на авторитетный узел именования (используется для IP-телефонии).
     * 
     * Код: `35`
     * 
     * [RFC 3263](https://tools.ietf.org/html/rfc3263), [RFC 3403](https://tools.ietf.org/html/rfc3403)
     */
    var NAPTR = "NAPTR";

    /**
     * Null record.  
     * Пустая запись. Редкоупотребима, экспериментальна.
     * 
     * Код: `10`
     * 
     * [RFC 1035](https://tools.ietf.org/html/rfc1035)
     */
    var NULL = "NULL";

    /**
     * **Authoritative name server**  
     * [DNS](https://ru.wikipedia.org/wiki/DNS)
     * Адрес узла, отвечающего за доменную зону. Критически важна для
     * функционирования самой системы доменных имён.
     * 
     * Код: `2`
     * 
     * [RFC 1035](https://tools.ietf.org/html/rfc1035)
     */
    var NS = "NS";

    /**
     * Network service access point address. *(Редкоупотребима)*  
     * Указатели в стиле [OSI](https://ru.wikipedia.org/wiki/%D0%A1%D0%B5%D1%82%D0%B5%D0%B2%D0%B0%D1%8F_%D0%BC%D0%BE%D0%B4%D0%B5%D0%BB%D1%8C_OSI)
     * 
     * Код: `22`
     * 
     * [RFC 1706](https://tools.ietf.org/html/rfc1706)
     */
    var NSAP = "NSAP";

    /**
     * ~~NSAP pointer~~. *(Устарела)*  
     * Указатель на NSAP.
     * 
     * Код: `23`
     * 
     * [RFC 1348](https://tools.ietf.org/html/rfc1348)
     */
    var NSAP_PTR = "NSAP-PTR";

    /**
     * Next-Secure record. [DNSSEC](https://ru.wikipedia.org/wiki/DNSSEC)  
     * Часть DNSSEC, подтверждает отсутствие записи. Формат — как у NXT.
     * 
     * Код: `47`
     * 
     * [RFC 4034](https://tools.ietf.org/html/rfc4034)
     */
    var NSEC = "NSEC";

    /**
     * Next-Secure record. [DNSSEC](https://ru.wikipedia.org/wiki/DNSSEC)  
     * Расширение DNSSEC, подтверждающее отсутствие записи без возможности
     * просмотра содержимого зоны.
     * 
     * Код: `50`
     * 
     * [RFC 5155](https://tools.ietf.org/html/rfc5155)
     */
    var NSEC3 = "NSEC3";

    /**
     * NSEC3 parameters. [DNSSEC](https://ru.wikipedia.org/wiki/DNSSEC)  
     * Запись с параметрами для NSEC3.
     * 
     * Код: `51`
     * 
     * [RFC 5155](https://tools.ietf.org/html/rfc5155)
     */
    var NSEC3PARAM = "NSEC3PARAM";

    /**
     * ~~Next domain~~. *(Устарела [DNSSEC](https://ru.wikipedia.org/wiki/DNSSEC))*  
     * Указатель на следующий домен подписанной зоны.
     * 
     * Код: `30`
     * 
     * [RFC 2065](https://tools.ietf.org/html/rfc2065)
     */
    var NXT = "NXT";

    /**
     * **Pointer**  
     * Соответствие адреса имени — обратное соответствие для A и AAAA.  
     * Широко используется для IPv4-адресов в домене [in-addr.arpa](https://ru.wikipedia.org/wiki/%D0%9E%D0%B1%D1%80%D0%B0%D1%82%D0%BD%D1%8B%D0%B9_%D0%BF%D1%80%D0%BE%D1%81%D0%BC%D0%BE%D1%82%D1%80_DNS),
     * для IPv6 — в [ip6.arpa](https://ru.wikipedia.org/wiki/%D0%9E%D0%B1%D1%80%D0%B0%D1%82%D0%BD%D1%8B%D0%B9_%D0%BF%D1%80%D0%BE%D1%81%D0%BC%D0%BE%D1%82%D1%80_DNS)
     * 
     * Код: `12`
     * 
     * [RFC 1035](https://tools.ietf.org/html/rfc1035)
     */
    var PTR = "PTR";

    /**
     * Pointer to X.400  
     * Указатель на систему маршрутизации почты [X.400](https://ru.wikipedia.org/wiki/X.400)
     * 
     * Код: `26`
     * 
     * [RFC 822](https://tools.ietf.org/html/rfc822), [RFC 2163](https://tools.ietf.org/html/rfc2163)
     */
    var PX = "PX";

    /**
     * Responsible person.  
     * Ответственный.
     * 
     * Код: `17`
     * 
     * [RFC 1183](https://tools.ietf.org/html/rfc1183)
     */
    var RP = "RP";

    /**
     * DNSSEC signature.  
     * Подпись записи средствами [DNSSEC](https://ru.wikipedia.org/wiki/DNSSEC). Формат — как у SIG.
     * 
     * Код: `46`
     * 
     * [RFC 4034](https://tools.ietf.org/html/rfc4034)
     */
    var RRSIG = "RRSIG";

    /**
     * Route through. *(Малоупотребима)*  
     * Указание на узел, через который следует осуществлять маршрутизацию.
     * 
     * Код: `21`
     * 
     * [RFC 1183](https://tools.ietf.org/html/rfc1183)
     */
    var RT = "RT";

    /**
     * Cryptographic public key signature. *(Малоупотребима)*  
     * Сигнатура публичной подписи.
     * 
     * Код: `24`
     * 
     * [RFC 2931](https://tools.ietf.org/html/rfc2931)
     */
    var SIG = "SIG";

    /**
     * **Start of authority**  
     * [DNS](https://ru.wikipedia.org/wiki/DNS)
     * Указание на авторитетность информации, используется для указания на новую зону.
     * 
     * Код: `6`
     * 
     * [RFC 1035](https://tools.ietf.org/html/rfc1035)
     */
    var SOA = "SOA";

    /**
     * ~~Sender Policy Framework~~. *(Устарела)*  
     * Указывает серверы, которые могут отправлять почту с данного домена.
     * 
     * Код: `99`
     * 
     * [RFC 4408](https://tools.ietf.org/html/rfc4408), [RFC 7208](https://tools.ietf.org/html/rfc7208)
     */
    var SPF = "SPF";

    /**
     * [Service locator](https://ru.wikipedia.org/wiki/SRV-%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D1%8C)  
     * Указание на местоположение серверов для сервисов.  
     * [XMPP](https://ru.wikipedia.org/wiki/XMPP), [Active Directory](https://ru.wikipedia.org/wiki/Active_Directory)
     * 
     * Код: `33`
     * 
     * [RFC 2782](https://tools.ietf.org/html/rfc2782)
     */
    var SRV = "SRV";

    /**
     * SSH Fingerprints. *(Малоупотребима)*  
     * [Отпечаток ключа SSH](https://ru.wikipedia.org/wiki/%D0%9E%D1%82%D0%BF%D0%B5%D1%87%D0%B0%D1%82%D0%BE%D0%BA_%D0%BE%D1%82%D0%BA%D1%80%D1%8B%D1%82%D0%BE%D0%B3%D0%BE_%D0%BA%D0%BB%D1%8E%D1%87%D0%B0)
     * 
     * Код: `44`
     * 
     * [RFC 4255](https://tools.ietf.org/html/rfc4255)
     */
    var SSHFP = "SSHFP";

    /**
     * Transaction key.  
     * Метод распространения ключей для TSIG-записей.
     * 
     * Код: `249`
     * 
     * [RFC 2930](https://tools.ietf.org/html/rfc2930)
     */
    var TKEY = "TKEY";

    /**
     * Certificate association.  
     * Ресурсная запись [DANE](https://ru.wikipedia.org/wiki/DANE)
     * 
     * Код: `52`
     * 
     * [RFC 6698](https://tools.ietf.org/html/rfc6698)
     */
    var TLSA = "TLSA";

    /**
     * Transaction signature.  
     * Идентификация для DNS-операций с использованием общих секретных ключей
     * и хэшей при [передаче зон](https://ru.wikipedia.org/wiki/%D0%9F%D0%B5%D1%80%D0%B5%D0%B4%D0%B0%D1%87%D0%B0_%D0%B7%D0%BE%D0%BD%D1%8B_DNS)
     * между DNS-серверами.
     * 
     * Код: `250`
     * 
     * [RFC 2845](https://tools.ietf.org/html/rfc2845)
     */
    var TSIG = "TSIG";

    /**
     * **Text string**    
     * Запись произвольных двоичных данных, до 255 байт в размере.
     * [Sender Policy Framework](https://ru.wikipedia.org/wiki/Sender_Policy_Framework),
     * DNS-туннели и прочее.
     * 
     * Код: `16`
     * 
     * [RFC 1035](https://tools.ietf.org/html/rfc1035)
     */
    var TXT = "TXT";

    /**
     * Well-known service.  
     * Список доступных общеизвестных сервисов (общеизвестные — с
     * регистрированными номерами портов).
     * 
     * Код: `11`
     * 
     * [RFC 1035](https://tools.ietf.org/html/rfc1035)
     */
    var WKS = "WKS";

    /**
     * PSDN address. *(Редкоупотребима)*  
     * Адрес в формате [X.25](https://ru.wikipedia.org/wiki/X.25)
     * 
     * Код: `19`
     * 
     * [RFC 1183](https://tools.ietf.org/html/rfc1183)
     */
    var X25 = "X25";
}
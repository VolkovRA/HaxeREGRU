# Haxe клиент для API [REG.RU](https://www.reg.ru "REG.RU 🔷 Российский хостинг-провайдер и регистратор доменов")

Зачем это нужно
------------

Позволяет использовать [API](https://www.reg.ru/support/help/api2) хостинга из Haxe приложения на JavaScript.

Описание
------------

Это небольшая библиотека - заготовка для реализации API `2.0` клиента, хостинга REG.RU. Позволяет очень легко вызывать методы. Не содержит полный перечень всех доступных методов, но может быть легко расширена путём добавления нового класса для нового метода API. Для сетевых HTTP/S вызовов используется кроссплатформенная библиотека [HaxeLoader](https://github.com/VolkovRA/HaxeLoader), благодоря чему этот клиент может работать как в NodeJS, так и в браузере. (Второе не тестировалось)

Как использовать
------------------------------

```
var api = new regru.RegRU();

// Проверка API:
api.nop(
    {
        username: "USERNAME",
        password: "********"
    },
    function(item) {
        trace(item.error);
        trace(item.data);
    }
);
```

Добавление библиотеки
------------------------------

1. Установите haxelib себе на локальную машину, чтобы вы могли использовать библиотеки Haxe.
2. Установите regru себе на локальную машину, глобально, используя cmd:
```
haxelib git regru https://github.com/VolkovRA/HaxeREGRU master
```
Синтаксис команды:
```
haxelib git [project-name] [git-clone-path] [branch]
haxelib git minject https://github.com/massiveinteractive/minject.git         # Use HTTP git path.
haxelib git minject git@github.com:massiveinteractive/minject.git             # Use SSH git path.
haxelib git minject git@github.com:massiveinteractive/minject.git v2          # Checkout branch or tag `v2`.
```
3. Добавьте библиотеку regru в ваш Haxe проект.

Дополнительная информация:
 * [Документация REG.RU](https://www.reg.ru/support/help/api2 "Документация на REG.API 2")
 * [Документация Haxelib](https://lib.haxe.org/documentation/using-haxelib/ "Using Haxelib")
 * [Документация компилятора Haxe](https://haxe.org/manual/compiler-usage-hxml.html "Configure compile.hxml")
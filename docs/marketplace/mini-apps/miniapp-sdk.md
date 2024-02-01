---
layout: default
nav_order: 20
title: "MiniApp SDK"
parent: "Мини-приложения"
grand_parent: "Маркетплейс"
date: 2024-02-01 00:00:00 +0300
---

# Инвосбокс MiniApp SDK

Библиотека `minapp-sdk` позволяет приложениям использовать API Инвойсбокс и API операционной системы, установленной на устройстве пользователя.
Библиотека является мостом между приложениями, работающими на стороне пользователя, и клиентской частью Инвойсбокс (десктопной версией платёжного
сервиса, мобильной версией платёжного сервиса или мобильным приложением). Именно они обмениваются данными с серверами Инвойсбокс, а библиотека
работает как посредник на стороне пользователя.

- NPM: [minapp-sdk](https://www.npmjs.com/package/@invoicebox/minapp-sdk)
- GitHub: [minapp-sdk](https://github.com/InvoiceBox/invoicebox-minapp-sdk)

## Как использовать библиотеку MiniApp SDK

Чтобы использовать библиотеку:

1. Создайте проект мини-приложения.
2. Подключите MiniApp SDK.
3. Вызовите событие MiniApp SDK.
   - Метод invoiceboxMinapp.connect.
4. Обработайте события:
   - Событие invoiceboxMinapp.onHeightChange.
   - Событие invoiceboxMinapp.onDone.
   - Событие invoiceboxMinapp.onError.
   - Событие invoiceboxMinapp.onLink.
5. Используйте методы:
   - Метод invoiceboxMinapp.getInitialData.

Инструкция ниже актуальна для любой операционной системы. Для первых шагов потребуется знание языка JavaScript и умение работать с командной строкой.

## Подключение MiniApp SDK

### Через пакет NPM

1. Перейдите в созданный проект мини-приложения:

```
cd <ПУТЬ_К_МИНИ_ПРИЛОЖЕНИЮ>
```

2. Установите библиотеку:

```
npm install @invoicebox/minapp-sdk || yarn add @invoicebox/minapp-sdk
```

3. Инициализируйте MiniApp SDK в файле index.js:

```
import { invoiceboxMinapp } from '@invoicebox/minapp-sdk';

invoiceboxMinapp.connect(); 
```


### Включение скрипта в HTML-код страницы

Этот способ подходит, если вы не используете менеджеры пакетов, такие как npm или yarn, для создания своего HTML-приложения.

1. В код каждой HTML-страницы, где вы будете вызывать библиотеку, добавьте ссылку на файл index.min.js.

В репозитории MiniApp SDK этот файл находится в папке cjs (commonjs modules). Мы рекомендуем ссылаться на копию файла, расположенную
на сервисе unpkg.com. В этом случае вы автоматически будете получать последнюю версию библиотеки и вам не нужно будет самостоятельно
следить за выходом её обновлений.

```
<script src="https://unpkg.com/@invoicebox/minapp-sdk/cjs/index.min.js"></script>
```

2. В коде каждой HTML-страницы, где вы будете вызывать библиотеку, инициализируйте MiniApp SDK:

```
<script>
  const Miniapp = new InvoiceboxMinapp()
  Minapp.connect();
</script>
```

## События и методы

### Методы connect & disconnect

Чтобы начать слушать сообщения от родительского окна, следует вызвать метод `invoiceboxMinapp.connect()`,
чтобы перестать слушать, следует вызвать метод `invoiceboxMinapp.disconnect()`.

```
connect(): void;
disconnect(): void;
```

Пример использования

```
useEffect(() => {
    invoiceboxMinapp.connect();
    return () => {
        invoiceboxMinapp.disconnect();
    };
}, [invoiceboxMinapp]);
```

### Метод getInitialData

Для того, чтобы получить данные покупателя для оформления заказа, воспользуйтесь методом `getInitialData`.

```
getInitialData(): Promise<{
    orderContainerId?: string;
    userEmail: string;
    userName: string;
    userPhone: string;
}>
```

Пример использования

```
invoiceboxMinapp.getInitialData().then(console.log);

/*
{
    orderContainerId: 'asd';
    userEmail: 'email@example.com';
    userName: 'Иван Иванов';
    userPhone: '+12345678910';
}
*/
```

### Событие onHeightChange

Для управления высотой мини-приложения на платёжной странице используется метод `onHeightChange`.
Мини-приложение может задать высоту, которая требуется для корректного отображения мини-приложения
на платёжной странице.

```
onHeightChange(height: number): void;
```

Пример использования

```
const Conatiner = ({ isConnected, children }: { isConnected: boolean, children: ReactNode }) => {
    const [elRef, setElRef] = useState<HTMLDivElement | null>(null);

    useEffect(() => {
        if (!elRef) return;
        if (!isConnected) return;
        const observer = new ResizeObserver(() => {
            invoiceboxMinapp.onHeightChange(elRef.offsetHeight);
        });
        observer.observe(elRef);
        return () => observer.disconnect();
    }, [elRef, child, isConnected]);

    return <div ref={elRef}>{children}</div>;
}
```

### Событие onDone

После того, как мини-приложение успешно добавило новый заказ в существующий `orderContainer` или создало новый, необходимо вызвать метод `onDone`. `paymentUrl` приходит от сервера в момент создания заказа.

```
onDone(paymentUrl: string): void
```

Пример использования

```
 createOrderRequest(someData)
    .then((response) => {
        invoiceboxMinapp.onDone(response.data.url);
    })
```

### Событие onError

```
onError(message?: string): void
```

В случае возникновения ошибки в мини-приложении, можно вызвать метод `onError`. Тогда родительская страница уведомит пользователя, что произошла ошибка. Функция принимает один опциональный строковый аргумент - пользовательское сообщение. Если сообщение есть, то оно отобразится. Если нет, то отобразится сообщение по умолчанию `Что-то пошло не так`.

```
invoiceboxMinapp.onError('Ошибка создания заказа'); // пользователь увидит "Ошибка создания заказа"
invoiceboxMinapp.onError(); // пользователь увидит "Что-то пошло не так"
```

### Событие onLink

```
onLink(href: string): void
```

Метод `onLink` позволяет окрыть ссылку, как будто ссылка нажата не в контексте `iframe`/`webview`, а в контексте родительской страницы.

```
// На платёжной странице будет открыта новая вкладка с Google страницей, это никак не повлияет на мини-приложение.
invoiceboxMinapp.onLink('https://www.google.ru`);
```


[Читать далее &raquo;](/docs/marketplace/create/){: .btn .btn-primary .mb-4 .mb-md-0 .mr-2 }
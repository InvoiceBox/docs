---
layout: default
nav_order: 90
title: "MiniApp SDK"
parent: "Мини-приложения"
grand_parent: "Маркетплейс"
date: 2024-02-19 00:00:00 +0300
---

# Инвосбокс MiniApp SDK

Библиотека `minapp-sdk` позволяет мини-приложениям использовать API Инвойсбокс и API операционной системы, установленной
на устройстве пользователя.

Библиотека является мостом между мини-приложениями, работающими на стороне пользователя, и клиентской частью Инвойсбокс
(десктопной версией платёжного сервиса, мобильной версией платёжного сервиса или мобильным приложением). Именно они
обмениваются данными с серверами Инвойсбокс, а библиотека работает как посредник на стороне пользователя.

- NPM: [minapp-sdk](https://www.npmjs.com/package/@invoicebox/minapp-sdk)
- GitHub: [minapp-sdk](https://github.com/InvoiceBox/invoicebox-minapp-sdk)

## Как использовать библиотеку MiniApp SDK

Чтобы использовать библиотеку:

1. Создайте проект мини-приложения
2. [Подключите MiniApp SDK](/docs/marketplace/mini-apps/miniapp-sdk/#%D0%BF%D0%BE%D0%B4%D0%BA%D0%BB%D1%8E%D1%87%D0%B5%D0%BD%D0%B8%D0%B5-miniapp-sdk)
3. Используйте методы:
   - Метод [invoiceboxMinapp.connect](/docs/marketplace/mini-apps/miniapp-sdk/#%D0%BC%D0%B5%D1%82%D0%BE%D0%B4-connect). Установить соединение с родительским окном.
   - Метод [invoiceboxMinapp.disconnect](/docs/marketplace/mini-apps/miniapp-sdk/#%D0%BC%D0%B5%D1%82%D0%BE%D0%B4-disconnect). Разорвать соединение с родительским окном.
   - Метод [invoiceboxMinapp.isConnected](/docs/marketplace/mini-apps/miniapp-sdk/#%D0%BC%D0%B5%D1%82%D0%BE%D0%B4-isconnected). Узнать, установлено ли соединение с родительским окном.
   - Метод [invoiceboxMinapp.getInitialData](/docs/marketplace/mini-apps/miniapp-sdk/#%D0%BC%D0%B5%D1%82%D0%BE%D0%B4-getinitialdata). Получить данные покупателя от родительского окна.
   - Метод [invoiceboxMinapp.matchSomeMetaData](/docs/marketplace/mini-apps/miniapp-sdk/#%D0%BC%D0%B5%D1%82%D0%BE%D0%B4-matchsomemetadata). Узнать, есть ли в метаданных нужная информация.
4. Обработайте события:
   - Событие [invoiceboxMinapp.onHeightChange](/docs/marketplace/mini-apps/miniapp-sdk/#%D1%81%D0%BE%D0%B1%D1%8B%D1%82%D0%B8%D0%B5-onheightchange). Сообщить родительскому окну параметры высоты мини-приложения.
   - Событие [invoiceboxMinapp.onDone](/docs/marketplace/mini-apps/miniapp-sdk/#%D1%81%D0%BE%D0%B1%D1%8B%D1%82%D0%B8%D0%B5-ondone). Сообщить родительскому окну о готовности заказа к оплате.
   - Событие [invoiceboxMinapp.onError](/docs/marketplace/mini-apps/miniapp-sdk/#%D1%81%D0%BE%D0%B1%D1%8B%D1%82%D0%B8%D0%B5-onerror). Сообщить родительскому окну об ошибке в мини-приложении.
   - Событие [invoiceboxMinapp.onLink](/docs/marketplace/mini-apps/miniapp-sdk/#%D1%81%D0%BE%D0%B1%D1%8B%D1%82%D0%B8%D0%B5-onlink). Сообщить родительскому окну о необходимости открыть страницу.
   - Событие [invoiceboxMinapp.onUnavailable](/docs/marketplace/mini-apps/miniapp-sdk/#%D1%81%D0%BE%D0%B1%D1%8B%D1%82%D0%B8%D0%B5-onunavailable). Сообщить родительскому окну, что мини-приложение недоступно.

Инструкция ниже актуальна для любой операционной системы. Для первых шагов потребуется знание языка JavaScript и умение работать с командной строкой.

## Подключение MiniApp SDK

Родительским окном мини-приложения может быть `iframe` или `WebView`.

### Через пакет NPM

Перейдите в созданный проект мини-приложения:

```
cd <ПУТЬ_К_МИНИ_ПРИЛОЖЕНИЮ>
```

Установите библиотеку:

```
npm install @invoicebox/minapp-sdk || yarn add @invoicebox/minapp-sdk
```

Инициализируйте MiniApp SDK в файле index.js:

```
import { invoiceboxMinapp } from '@invoicebox/minapp-sdk';

invoiceboxMinapp.connect();
```

### Включение скрипта в HTML-код страницы

Этот способ подходит, если вы не используете менеджеры пакетов, такие как npm или yarn, для создания своего HTML-приложения.

**В код каждой HTML-страницы, где вы будете вызывать библиотеку, добавьте ссылку на файл index.min.js**

В репозитории MiniApp SDK этот файл находится в папке cjs (commonjs modules). Мы рекомендуем ссылаться на копию файла, расположенную
на сервисе unpkg.com. В этом случае вы автоматически будете получать последнюю версию библиотеки и вам не нужно будет самостоятельно
следить за выходом её обновлений.

```html
<!-- Если требуется зафиксировать версию, например, 3.0.1 -->
<script src="https://unpkg.com/@invoicebox/minapp-sdk@3.0.1/cjs/index.min.js"></script>

<!-- Крайняя версия (следует использовать аккуратно, так как крайние изменения могут быть не совместимы) -->
<script src="https://unpkg.com/@invoicebox/minapp-sdk/cjs/index.min.js"></script>
```

**В коде каждой HTML-страницы, где вы будете вызывать библиотеку, инициализируйте MiniApp SDK**

```html
<script>
  invoiceboxMinapp.connect();
</script>
```

## События и методы

### Метод connect

Для того, чтобы установить соединение с родительским окном, воспользуйтесь методом `connect`.

```ts
connect(): void;
```

### Метод disconnect

Чтобы разорвать соединение с родительским окном, воспользуйтесь методом `disconnect`.

```ts
disconnect(): void;
```

### Метод isConnected

Чтобы узнать установлено ли соединение с родительским окном, воспользуйтесь методом `isConnected`.

```ts
isConnected(): boolean;
```

### Метод getInitialData

Для того, чтобы получить данные покупателя для оформления заказа, воспользуйтесь методом `getInitialData`.

```ts
getInitialData(): Promise<{
    shopId?: number;
    userEmail: string;
    userName: string;
    userPhone: string;
    fullHeight: boolean;
    locale: string;
} & (
    | {
          orderContainerId?: never;
          minappType: 'order';
      }
    | {
          orderContainerId: string;
          minappType: 'suborder';
      }
)>
```

- minappType - значение `order` указывает, что мини-приложение работает в режиме основного заказа, значение `suborder` - в режиме дополнительной услуги
- orderContainerId - обязательно, если `minappType: 'suborder'`, отсутствует, если `minappType: 'order'`, идентификатор родительского заказа в случае, если заказ является дополнительной услугой
- shopId - опционально, идентификатор точки продаж, если мини-приложение работает с множеством точек продаж
- userEmail - адрес электронной почты покупателя
- userName - имя покупателя
- userPhone - номер мобильного телефона покупателя
- fullHeight - флаг сообщающий, что мини-приложение должно занять всю высоту контейнера, в котором располагается
- locale - локаль

Пример использования

```ts
invoiceboxMinapp.getInitialData().then(console.log);

/*
{
    minappType: 'suborder',
    orderContainerId: '3c15a3d1-3da8-4ba8-87e5-2dba828299fa',
    shopId: 123,
    userEmail: 'email@example.com',
    userName: 'Иван Иванов',
    userPhone: '+71231234567',
    fullHeight: false,
    locale: 'ru';
}
*/
```

### Метод matchSomeMetaData

Общая информация по наличию метаданных в заказах описана в [документации](/docs/merchant/order/metadata/).
Для того, чтобы узнать есть ли нужная информация в метаданных, воспользуйтесь методом `matchSomeMetaData`.

```ts
matchSomeMetaData(targetKey: string, targetValues: unknown[]): Promise<boolean>
```

- targetKey - ключ (название свойства) по которому будет осуществлен поиск
- targetValues - массив возможных значений, если хотя бы одно значение из этого массива совпадет со значемием в метаданных, функция вернет `true`, в противном случае `false`

Пример использования

```ts
/*
  если метаданные содержат поле iataCode: "SU" или iataCode: "LED", метод вернет true
*/
invoiceboxMinapp
  .matchSomeMetaData("iataCode", ["SU", "LED"])
  .then((isMatch) => {
    if (isMatch) {
      // do something
    }
  });
```

### Событие onHeightChange

Для управления высотой мини-приложения на платёжной странице используется метод `onHeightChange`.
Мини-приложение может задать высоту, которая требуется для корректного отображения мини-приложения
на платёжной странице.

```ts
onHeightChange(height: number): void;
```

Пример использования

```ts
const Conatiner = ({ children }: { children: ReactNode }) => {
  const [elRef, setElRef] = useState<HTMLDivElement | null>(null);

  useEffect(() => {
    if (!elRef) return;
    const observer = new ResizeObserver(() => {
      invoiceboxMinapp.onHeightChange(elRef.offsetHeight);
    });
    observer.observe(elRef);
    return () => observer.disconnect();
  }, [elRef, child]);

  return <div ref={elRef}>{children}</div>;
};
```

### Событие onDone

После того, как мини-приложение успешно добавило новый заказ в существующий `orderContainer` или создало новый,
необходимо вызвать метод `onDone`. `paymentUrl` приходит от сервера в момент создания заказа.

Если закз успешно создан, но будет оплачен не через систему инвойсбокс, допускается вызов метода без передачи платежной ссылки: `onDone(null)`. Пользователь увидит, что мини-приложение успешно завершло работу, но переадресации для оплаты не произойдет.

```ts
onDone(paymentUrl: string | null): void
```

Пример использования

```ts
createOrderRequest(someData).then((response) => {
  invoiceboxMinapp.onDone(response.data.url);
});
```

### Событие onError

В случае возникновения ошибки в мини-приложении (например, при оформлении заказа, при взаимодействии с API Инвойсбокс и т.д.),
необходимо вызвать метод `onError`. Родительская страница уведомит пользователя об ошибке. Функция принимает один опциональный
строковый аргумент - пользовательское сообщение. Если сообщение есть, то оно отобразится. Если нет, то отобразится сообщение
по умолчанию `Что-то пошло не так`.

```ts
onError(message?: string): void
```

Пример использования

```ts
// Пользователь увидит "Ошибка создания заказа"
invoiceboxMinapp.onError("Ошибка создания заказа");

// Пользователь увидит "Что-то пошло не так"
invoiceboxMinapp.onError();
```

### Событие onLink

Метод `onLink` позволяет произвести переадресацию пользователя по ссылке в родительском окне, как будто переадресация была
вызвана не в контексте `iframe`/`webview`, а в контексте родительской страницы.

```ts
onLink(href: string): void
```

Пример использования

```ts
// На платёжной странице будет открыта новая вкладка с Google страницей
// это никак не повлияет на работу мини-приложения
invoiceboxMinapp.onLink("https://www.google.ru");
```

### Событие onUnavailable

Метод `onUnavailable` позволяет сообщить родительскому окну, что мини-приложение недоступно. Мини-приложение будет закрыто. Пользователь увидит соответствующее сообщение.

```ts
onUnavailable(): void
```

Пример использования

```ts
invoiceboxMinapp.onUnavailable();
```

---

[Читать далее &raquo;](/docs/marketplace/create/){: .btn .btn-primary .mb-4 .mb-md-0 .mr-2 }

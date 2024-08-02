---
layout: default
nav_order: 1
title: Создание заказа
parent: "Работа с заказом"
grand_parent: "Приём платежей"
date: 2023-12-06 00:00:00 +0300
---

# Создание заказа

Для создания заказа, необходимо вызвать следующий метод API:

- метод: `POST`
- ресурс: `/v3/billing/api/order/order`
- тело запроса - объект [CreateOrderRequest](#createorderrequest)
- тело ответа - объект [OrderResponse](#orderresponse)
- Возможные [ошибки](/docs/dictionary/error/)

<details>
  <summary>Пример запроса</summary>
<section markdown="1">
``` json
POST /v3/billing/api/order/order
Authorization: Bearer b37c4c689295904ed21eee5d9a48d42e
Content-Type: application/json
User-Agent: MyApp 1.0
Accept: application/json
{
  "merchantId": "01771534-196a-1105-839a-82422289d6d9",
  "merchantOrderId": "m-1608560079",
  "amount": 371.88,
  "successUrl": "https://merchant.ru/order/xxx?result=success",
  "failUrl": "https://merchant.ru/order/xxx?result=fail",
  "returnUrl": "https://merchant.ru/order/xxx?result=return",
  "vatAmount": 61.98,
  "basketItems": [
    {
      "sku": "5fe0adcfa7fb4",
      "name": "Бронирование номера",
      "measure": "шт.",
      "measureCode": "796",
      "grossWeight": 0,
      "netWeight": 0,
      "quantity": 3,
      "amount": 123.96,
      "amountWoVat": 103.3,
      "totalAmount": 371.88,
      "totalVatAmount": 61.98,
      "vatCode": "RUS_VAT20",
      "type": "service",
      "paymentType": "full_prepayment"
    }
  ],
  "metaData": {
    "@type": "LodgingReservation",
    "reservationId": "abc456",
    "reservationStatus": "https://schema.org/ReservationConfirmed",
    "underName": {
      "@type": "Person",
      "name": "John Smith"
    },
    "reservationFor": {
      "@type": "LodgingBusiness",
      "name": "Hilton San Francisco Union Square",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "333 O'Farrell St",
        "addressLocality": "San Francisco",
        "addressRegion": "CA",
        "postalCode": "94102",
        "addressCountry": "US"
      },
      "telephone": "415-771-1400"
    },
    "checkinTime": "2017-04-11T16:00:00-08:00",
    "checkoutTime": "2017-04-13T11:00:00-08:00"
  },
  "expirationDate": "2020-12-22T00:00:00+00:00",
  "languageId": "ru",
  "currencyId": "RUB",
  "description": "Оплата номера в отеле",
  "customer": {
    "type": "private",
    "name": "Peter",
    "phone": "79001112233",
    "email": "peter@domain.com",
    "vatNumber": "",
    "registrationAddress": ""
  }
}
```
</section>
</details>

## CreateOrderRequest

| Свойство               | Обязательное | Тип                                | Описание                                                                                                                                     | Пример значения                        |
|------------------------|--------------|------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------|
| description            | да           | string(1000)                       | Описание заказа                                                                                                                              | `Оплата номера в отеле`                |
| merchantId             | да           | string(36)                         | Идентификатор магазина                                                                                                                       | `01771534-1a57-f184-dee3-ebeb91dded76` |
| merchantOrderId        | да           | string(256)                        | Идентификатор заказа в учётной системе магазина, должен быть уникальным                                                                      | `O-12345`                              |
| merchantOrderIdVisible | нет          | string(256)                        | Номер заказа, отображаемый на платежной странице. Если не заполнено, показывается значение из merchantOrderId                                | `111TN22-33`                           |
| amount                 | да           | float                              | Сумма заказа, ограничений нет                                                                                                                | `19658.45`                             |
| vatAmount              | да           | float                              | Сумма НДС                                                                                                                                    | `156.56`                               |
| currencyId             | да           | string(3) enum                     | Код валюты заказа в соответствии с [ISO 4217](/docs/dictionary/iso4217/)                                                                     | `RUB`, `USD`,`EUR`, `GBP`              |
| languageId             | нет          | string(2) enum                     | Язык интерфейса платежной страницы                                                                                                           | `ru`, `en`                             |
| expirationDate         | да           | datetime                           | Срок действия заказа                                                                                                                         | `2020-12-22T00:00:00+00:00`            |
| basketItems            | да           | array of [BasketItem](#basketitem) | Корзина заказа                                                                                                                               |                                        |
| metaData               | нет          | object                             | [Дополнительные данные заказа](/docs/merchant/order/metadata/)                                                                               |                                        |
| customer               | да           | [Customer](#customer)              | Информация о заказчике                                                                                                                       |                                        |
| notificationUrl        | нет          | string(1000)                       | URL для отправки [уведомлений](/docs/merchant/notification) об изменениях статуса заказа, по умолчанию используется URL из настроек магазина |                                        |
| successUrl             | нет          | string(1000)                       | Ссылка для перехода на сайт Магазина в случае успешной оплаты                                                                                |                                        |
| failUrl                | нет          | string(1000)                       | Ссылка для перехода на сайт Магазина в случае ошибки оплаты                                                                                  |                                        |
| returnUrl              | нет          | string(1000)                       | Ссылка для возврата на сайт Магазина                                                                                                         |                                        |
| invoiceSetting         | нет          | [InvoiceSetting](#invoicesetting)  | Дополнительные настройки параметров оплаты                                                                                                   |                                        |
| orderSetting           | нет          | [OrderSetting](#ordersetting)      | Дополнительные настройки параметров заказа                                                                                                   |                                        |
| parentId               | нет          | string(36)                         | Идентификатор базового заказа, применимо для создания [корректирующих заказов](/docs/merchant/refund/correction/)                            | `01771534-196a-1105-839a-82422289d6d9` |
| orderContainerId       | нет          | string(36)                         | Идентификатор основного заказа, применимо для добавления заказа к уже существующему счёту                                                    | `01771534-196a-1105-839a-82422289d6d9` |
| shopId                 | нет          | string(36)                         | Идентификатор связанного магазина/маркетплейса                                                                                               | `06581534-196a-1105-839a-82422289d6d8` |
| userAccountId          | нет          | string(36)                         | Идентификатор программы лояльности                                                                                                           | `06581534-196a-1105-839a-82422289d6d7` |
| processable            | нет          | bool                               | Является ли заказ [процессинговым.](/docs/merchant/order/non-processable-order/)                                                             | `true`, `false`                        |


## OrderResponse

Повторяет свойства объекта [CreateOrderRequest](#createorderrequest) с дополнительными свойствами:

| Свойство   | Обязательное | Тип             | Описание                                                | Пример значения                        |
|------------|--------------|-----------------|---------------------------------------------------------|----------------------------------------|
| id         | да           | string(36)      | Идентификатор заказа в системе Инвойсбокс               | `01771534-1a57-f184-dee3-ebeb91dded75` |
| paymentUrl | да           | string(1000)    | Ссылка для перехода на платёжный шлюз для оплаты заказа |                                        |
| createdAt  | да           | datetime        | Дата создания заказа                                    | `2020-12-22T00:00:00+00:00`            |
| status     | да           | string(50) enum | Статус заказа                                           | `completed`                            |
| paidAt     | нет          | datetime        | Дата оплаты заказа (если оплачен)                       | `2020-12-22T00:00:00+00:00`            |


{: .important }
> В зависимости от сценария использования API, ссылка для перехода на платёжный шлюз (paymentUrl) может быть получена для
> переадресации пользователя в браузере или же закодирована в QR-коде для дальнейшего его сканирования камерой или приложением
> Инвойсбокс.


## Customer

| Свойство                  | Обязательное | Тип             | Описание          | Пример значения                                      |
|---------------------------|--------------|-----------------|-------------------|------------------------------------------------------|
| type                      | нет          | string(10) enum | Тип заказчика     | `legal` - юр. лицо, `private` - физ лицо             |
| name                      | нет          | string(500)     | Имя               | `Peter`                                              |
| phone                     | нет          | string(100)     | Номер телефона    | `79001112233`                                        |
| email                     | нет          | string(100)     | Электронная почта | `peter@domain.com`                                   |
| vatNumber                 | нет          | string(20)      | ИНН               | `7710044140`                                         |
| taxRegistrationReasonCode | нет          | string(9)       | КПП               | `770201001`                                          |
| registrationAddress       | нет          | string(1000)    | Юр. адресс        | `190000, Санкт-Петербург, Невский пр. 147, офис 321` |

## BasketItem

Корзина заказа. Пожалуйста, внимательно ознакомьтесь с требованиями по [заполнению наименования номенклатуры](/docs/merchant/fz54/).

| Свойство          | Обязательное         | Тип                | Описание                                                                                                                                             |
|-------------------|----------------------|--------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| sku               | да                   | string(500)        | Артикул, например: `5fe0adcfa7fb4`                                                                                                                   |
| name              | да                   | string(500)        | Наименование, например `Бронирование номера`                                                                                                         |
| groupName         | нет                  | string(500)        | Наименование группы позиций заказа, используется для формирования отчетных документов                                                                |
| measure           | да                   | string(10)         | Единица измерения (для России - по [ОКЕИ](/docs/dictionary/okei/)), например `шт.`                                                                   |
| measureCode       | да                   | string(4)          | Код единицы измерения (для России - по [ОКЕИ](/docs/dictionary/okei/)), например `796`                                                               |
| originCountry     | нет                  | string(20)         | Страна происхождения товара, например, `Россия`                                                                                                      |
| originCountryCode | нет                  | string(4)          | Код страны происхождения, например, Россия `643`                                                                                                     |
| grossWeight       | нет                  | float              | Вес брутто, например `125.45`                                                                                                                        |
| netWeight         | нет                  | float              | Вес нетто, например `125.45`                                                                                                                         |
| quantity          | да                   | float              | Количество, например `3`                                                                                                                             |
| amount            | да                   | float              | Стоимость единицы, например `100.55`, ограничений нет                                                                                                |
| amountWoVat       | да                   | float              | Стоимость единицы без учета НДС                                                                                                                      |
| totalAmount       | да                   | float              | Стоимость всех единиц с НДС, например`123.55`                                                                                                        |
| totalVatAmount    | да                   | float              | Итого сумма НДС, например `23`                                                                                                                       |
| excise            | нет                  | float              | Сумма акциза, например, `10.00`                                                                                                                      |
| vatCode           | да                   | string(20) enum    | Код процента НДС, допустимые значения: `VATNONE` - не облагается,`VATNONE` - не облагается, `RUS_VAT0` - 0%, `RUS_VAT10` - 10%, `RUS_VAT20` - 20%    |
| type              | да                   | string(10) или int | Тип позиции, [в соответствии со справочником](/docs/dictionary/tag1212) или service - Услуга, commodity - Товар                                      |
| serviceDate       | нет                  | date               | Дата оказания услуги, если тип позиции = Услуга, например, 2023-11-16                                                                                |
| paymentType       | да                   | string(20) enum    | Тип оплаты, допустимые значения: `full_prepayment`, `prepayment`, `advance`, `full_payment`                                                          |
| categoryType      | при наличие category | string(20) enum    | Справочник категории товаров: `merchantHonestSignMap` (Справочник категорий магазина) или `honestSign` ([Честный знак](/docs/merchant/honest-sign/)) |
| category          | нет                  | string(20) enum    | Товарная группа в справочнике категорий товаров магазина или системы [Честный знак](/docs/merchant/honest-sign/): `milk`, `water` и т.д.             |
| metaData          | нет                  | object             | [Дополнительные данные элемента корзины](/docs/merchant/order/metadata/)                                                                             |

---

## InvoiceSetting

| Свойство              | Обязательное | Тип           | Описание                                                                                                        | Пример значения                                                         |
|-----------------------|--------------|---------------|-----------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| customerLocked        | нет          | bool          | Запретить изменение реквизитов плательщика (всех)                                                               | true - запретить изменения, по умолчанию false                          |
| customerLockedFields  | нет          | array<string> | Набор полей из [Customer](#customer), которые требуется запретить для редактирования на платежной странице      | `['type', 'name', 'phone', 'email', 'vatNumber', registrationAddress']` |
| paymentMethodIdLocked | нет          | bool          | Запретить изменение способа оплаты (платёжного инструмента)                                                     | true - запретить изменения, по умолчанию false                          |
| paymentMethodId       | нет          | int           | Идентификатор предвыбранного способа оплаты (платёжного инструмента)                                            | `123`                                                                   |


## OrderSetting

| Свойство             | Обязательное | Тип                  | Описание                                                                                                                                                                                                                                                                                                                                                                                                                  |
|----------------------|--------------|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| roundPolicy          | нет          | string(20)<br/>enum  | Тип округления итоговой суммы заказа. По умолчанию `strict`. Допустимые значения: `strict` - без округления, строгое соответствие, `none` - без округления, допустимо когда quantity * amount <= totalAmount, `floor` - округление к наименьшему целому, `ceil` - округление к наибольшему целому, `halfUp` - 0.50 округляется до большего целого, `halfDown` - 0.50 окруляется до меньшего целого. По умолчанию - `none` |

[Читать далее &raquo;](/docs/merchant/order/get){: .btn .btn-primary .mb-4 .mb-md-0 .mr-2 }

---
layout: default
nav_order: 40
title: "Обновление точки продаж"
parent: "Маркетплейс"
date: 2023-10-27 00:00:00 +0300
---

# Обновление точки продаж

Для обновления точки продаж, необходимо вызвать следующий метод API:

- метод: `POST`
- ресурс: `/v3/marketplace/api/shop/:id` - где `:id` это идентификатор точки продаж
- тело запроса - объект [UpdateShopRequest](#updateshoprequest)
- тело ответа - объект [ShopResponse](#shopresponse)
- Возможные [ошибки](/docs/dictionary/error/)

<details>
  <summary>Пример запроса</summary>
<section markdown="1">
``` json
POST /v3/marketplace/api/shop
Authorization: Bearer b37c4c689295904ed21eee5d9a48d42e
Content-Type: application/json
User-Agent: MyApp 1.0
Accept: application/json
{
  "description": "Это наш тестовый магазин",
  "notificationEmail": "test@test.me",
  "jivositeId": "321314123123",
  "yandexMetrikaId": 432141251234,
  "deliveryInfo": "Когда хотим, тогда и доставляем",
  "registrationAddress": "Санкт-Петербург, улица Рубинштейна, дом 12",
  "lat": 59.931228,
  "lon": 30.345557,
  "brandId": 123,
  "merchantId": "01771534-1a57-f184-dee3-ebeb91dded76",
  "externalUpdate": true
}
```
</section>
</details>

## UpdateShopRequest

| Свойство            | Обязательное | Тип             | Описание                                                                            | Пример значения                                                                  |
|---------------------|--------------|-----------------|-------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| description         | нет          | string(2000)    | Описание магазина                                                                   | `Это наш первый тестовый магазин`                                                |
| shopUrl             | нет          | string(64)      | Ссылка на магазин                                                                   | `https://1694158899.expressclient.ru`                                            |
| minOrderSum         | нет          | float           | Минимальная сумма заказа                                                            | 99.99                                                                            |
| notificationEmail   | нет          | string(500)     | Email для отправки уведомлений                                                      | `test@test.me`                                                                   |
| yandexMetrikaId     | нет          | int             |                                                                                     | 12332134222                                                                      |
| deliveryInfo        | нет          | string(1000)    | Описание доставки                                                                   | `Не доставляем по выходным и праздникам`                                         |
| type                | нет          | string(50) enum | Тип магазина                                                                        | `shop`,`marketplace`,`external`,`offline`,`brand`                                |
| registrationAddress | нет          | string(200)     | Адрес магазина                                                                      | `Санкт-Петербург, улица Рубинштейна, дом 12`                                     |
| lat                 | нет          | float           | Широта нахождения магазина                                                          | 59.931228                                                                        |
| lon                 | нет          | float           | Долгота нахождения магазина                                                         | 30.345557                                                                        |
| brandId             | нет          | int             | Идентификатор магазина с типом brand                                                | 123                                                                              |
| merchantId          | нет          | string(36)      | Идентификатор магазина Инвойсбокс, работает только в связвке с полем externalUpdate | `01771534-1a57-f184-dee3-ebeb91dded76`                                           |
| accountProgramIds   | нет          | array<string>   | Массив идентификаторов программ лояльностей, которые принимает точка                | [`01771534-1a57-f184-dee3-ebeb91dded71`,`01771534-1a57-f184-dee3-ebeb91dded72`]  |


## ShopResponse

Повторяет свойства объекта [CreateShopRequest](#createshoprequest):

[Читать далее &raquo;](/docs/marketplace/special-offer/){: .btn .btn-primary .mb-4 .mb-md-0 .mr-2 }

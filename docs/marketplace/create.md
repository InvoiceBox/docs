---
layout: default
nav_order: 30
title: "Добавление точки продаж"
parent: "Маркетплейс"
date: 2023-10-27 00:00:00 +0300
---

# Добавление точки продаж в маркетплейс

Для добавления магазина и точки продаж в маркетплейс, необходимо вызвать следующий метод API:

- метод: `POST`
- ресурс: `/v3/marketplace/api/shop`
- тело запроса - объект [CreateShopRequest](#createshoprequest)
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
  "title": "Тестовый магазин",
  "description": "Это наш тестовый магазин",
  "brandId": 123,
  "merchantId": "01771534-1a57-f184-dee3-ebeb91dded76",
  "externalUpdate": true
}
```
</section>
</details>

## CreateShopRequest

| Свойство          | Обязательное | Тип           | Описание                                                                   | Пример значения                                                                 |
|-------------------|--------------|---------------|----------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| title             | да           | string(50)    | Название магазина                                                          | `Тестовый магазин`                                                              |
| description       | нет          | string(2000)  | Описание магазина                                                          | `Это наш первый тестовый магазин`                                               |
| brandId           | нет          | int           | Идентификатор магазина с типом brand                                       | 123                                                                             |
| merchantId        | нет          | string(36)    | Идентификатор магазина Invoicebox, для подгрузки чсти данных из Invoicebox | `01771534-1a57-f184-dee3-ebeb91dded76`                                          |
| accountProgramIds | нет          | array<string> | Массив идентификаторов программ лояльностей, котоыре принимает точка       | [`01771534-1a57-f184-dee3-ebeb91dded71`,`01771534-1a57-f184-dee3-ebeb91dded72`] |


## ShopResponse

Повторяет свойства объекта [CreateShopRequest](#createshoprequest) с дополнительными свойствами:

| Свойство          | Обязательное | Тип             | Описание                                                             | Пример значения                                                                 |
|-------------------|--------------|-----------------|----------------------------------------------------------------------|---------------------------------------------------------------------------------|
| id                | да           | int             | Идентификатор магазина                                               | 12                                                                              |
| token             | да           | string(64)      | Токен магазина                                                       | `95e5396611d261986cec0915a9f85799`                                              |
| type              | да           | string(50) enum | Тип магазина                                                         | `shop`,`marketplace`,`external`,`offline`,`brand`                               |
| alias             | да           | string(20)      | Алиас магазина                                                       | `1694158899`                                                                    |
| shopUrl           | да           | string(64)      | Ссылка на магазин                                                    | `https://1694158899.expressclient.ru`                                           |
| accountProgramIds | нет          | array<string>   | Массив идентификаторов программ лояльностей, которые принимает точка | [`01771534-1a57-f184-dee3-ebeb91dded71`,`01771534-1a57-f184-dee3-ebeb91dded72`] |

[Читать далее &raquo;](/docs/marketplace/update/){: .btn .btn-primary .mb-4 .mb-md-0 .mr-2 }

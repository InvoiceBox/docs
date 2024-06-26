---
layout: default
nav_order: 50
title: "Смена магазина"
parent: "Работа с заказом"
grand_parent: "Приём платежей"
date: 2023-10-25 00:00:00 +0300
---
Для изменения статуса заказа, вы можете воспользоваться соответствующим методом. Изменить статус заказа можно
только у заказов с полем `processable = false`.

- метод: `PUT`
- ресурс: `/v3/billing/api/order/:uuid/status` - где `:uuid` это идентификатор заказа
- тело запроса - объект [UpdateOrderStatusRequest](#updateorderstatusrequest)
- тело ответа - объект [OrderResponse](/docs/merchant/order/create/#orderresponse)


## UpdateOrderStatusRequest

| Свойство | Обязательное | Тип        | Описание                                  | Пример значения                                   |
|----------|--------------|------------|-------------------------------------------|---------------------------------------------------|
| status   | да           | enum(4)    | Статус заказа                             | `created `, `completed `, `expired `, `cancelled` |

---

[Читать далее &raquo;](/docs/merchant/order/metadata){: .btn .btn-primary .mb-4 .mb-md-0 .mr-2 }

---
layout: default
nav_order: 4
title: "Отмена заказа"
parent: "Работа с заказом"
grand_parent: "Приём платежей"
---

# Отмена заказа

Отменить заказ возможно только до момента его полной оплаты.
После оплаты, пожалуйста, воспользуйтесь [методом оформления возврата](/docs/merchant/refund). 

:warning: В случае, если оплата заказа подтверждена с использованием гарантийных платёжных инструментов (Обещанный платёж, Гарантийный фонд, Овердрафт и т.д.),
отмена заказа инициирует полный возврат гарантийного платежа плательщику. Гарантийный платёж и его отмена не будут отражены в реестрах и финансовых отчётах.

Для отмены заказа до момента его полной оплаты, необходимо вызвать следующий метод API:

- метод: `DELETE`
- ресурс: `/v3/billing/api/order/order/:uuid` - где `:uuid` это идентификатор заказа
- тело запроса - отсутствует
- тело ответа - объект [OrderResponse](/docs/merchant/order/create/#orderresponse) со статусом `canceled`

---

[Читать далее &raquo;](/docs/merchant/order/merchant-move){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }